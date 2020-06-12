defmodule RcdWeb.UserAuthTest do
  use RcdWeb.ConnCase

  alias Admin.Accounts
  alias RcdWeb.UserAuth
  import Admin.AccountsFixtures

  @landing_url "/users/settings"
  @login_url "/users/login"

  setup %{conn: conn} do
    # Explicitly get a connection before each test
    # https://hexdocs.pm/ecto_sql/Ecto.Adapters.SQL.Sandbox.html
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Admin.Repo)
    # Setting the shared mode must be done only after checkout
    Ecto.Adapters.SQL.Sandbox.mode(Admin.Repo, {:shared, self()})

    conn =
      conn
      |> Map.replace!(:secret_key_base, RcdWeb.Endpoint.config(:secret_key_base))
      |> init_test_session(%{})

    %{user: user_fixture(), conn: conn}
  end

  describe "login_user/3" do
    test "stores the user token in the session", %{conn: conn, user: user} do
      conn = UserAuth.login_user(conn, user)
      assert token = get_session(conn, :user_token)
      assert get_session(conn, :live_socket_id) == "users_sessions:#{Base.url_encode64(token)}"
      assert redirected_to(conn) == @landing_url
      assert Accounts.get_user_by_session_token(token)
    end

    test "clears everything previously stored in the session", %{conn: conn, user: user} do
      conn = conn |> put_session(:to_be_removed, "value") |> UserAuth.login_user(user)
      refute get_session(conn, :to_be_removed)
    end

    test "redirects to the configured path", %{conn: conn, user: user} do
      conn = conn |> put_session(:user_return_to, "/hello") |> UserAuth.login_user(user)
      assert redirected_to(conn) == "/hello"
    end

    test "writes a cookie if remember_me is configured", %{conn: conn, user: user} do
      conn = conn |> fetch_cookies() |> UserAuth.login_user(user, %{"remember_me" => "true"})
      assert get_session(conn, :user_token) == conn.cookies["user_remember_me"]

      assert %{value: signed_token, max_age: max_age} = conn.resp_cookies["user_remember_me"]
      assert signed_token != get_session(conn, :user_token)
      assert max_age == 5_184_000
    end
  end

  describe "logout_user/1" do
    test "erases session and cookies", %{conn: conn, user: user} do
      user_token = Accounts.generate_user_session_token(user)

      conn =
        conn
        |> put_session(:user_token, user_token)
        |> put_req_cookie("user_remember_me", user_token)
        |> fetch_cookies()
        |> UserAuth.logout_user()

      refute get_session(conn, :user_token)
      refute conn.cookies["user_remember_me"]
      assert %{max_age: 0} = conn.resp_cookies["user_remember_me"]
      assert redirected_to(conn) == @login_url
      refute Accounts.get_user_by_session_token(user_token)
    end

    test "broadcasts to the given live_socket_id", %{conn: conn} do
      live_socket_id = "users_sessions:abcdef-token"
      Phoenix.PubSub.subscribe(RcdWeb.PubSub, live_socket_id)

      conn
      |> put_session(:live_socket_id, live_socket_id)
      |> UserAuth.logout_user()

      assert_receive %Phoenix.Socket.Broadcast{
        event: "disconnect",
        topic: "users_sessions:abcdef-token"
      }
    end

    test "works even if user is already logged out", %{conn: conn} do
      conn = conn |> fetch_cookies() |> UserAuth.logout_user()
      refute get_session(conn, :user_token)
      assert %{max_age: 0} = conn.resp_cookies["user_remember_me"]
      assert redirected_to(conn) == @login_url
    end
  end

  describe "fetch_current_user/2" do
    test "authenticates user from session", %{conn: conn, user: user} do
      user_token = Accounts.generate_user_session_token(user)
      conn = conn |> put_session(:user_token, user_token) |> UserAuth.fetch_current_user([])
      assert conn.assigns.current_user.id == user.id
    end

    test "authenticates user from cookies", %{conn: conn, user: user} do
      logged_in_conn =
        conn |> fetch_cookies() |> UserAuth.login_user(user, %{"remember_me" => "true"})

      user_token = logged_in_conn.cookies["user_remember_me"]
      %{value: signed_token} = logged_in_conn.resp_cookies["user_remember_me"]

      conn =
        conn
        |> put_req_cookie("user_remember_me", signed_token)
        |> UserAuth.fetch_current_user([])

      assert get_session(conn, :user_token) == user_token
      assert conn.assigns.current_user.id == user.id
    end

    test "does not authenticate if data is missing", %{conn: conn, user: user} do
      _ = Accounts.generate_user_session_token(user)
      conn = UserAuth.fetch_current_user(conn, [])
      refute get_session(conn, :user_token)
      refute conn.assigns.current_user
    end
  end

  describe "redirect_if_user_is_authenticated/2" do
    test "redirects if user is authenticated", %{conn: conn, user: user} do
      conn = conn |> assign(:current_user, user) |> UserAuth.redirect_if_user_is_authenticated([])
      assert conn.halted
      assert redirected_to(conn) == @landing_url
    end

    test "does not redirect if user is not authenticated", %{conn: conn} do
      conn = UserAuth.redirect_if_user_is_authenticated(conn, [])
      refute conn.halted
      refute conn.status
    end
  end

  describe "require_authenticated_user/2" do
    test "redirects if user is not authenticated", %{conn: conn} do
      conn = conn |> fetch_flash() |> UserAuth.require_authenticated_user([])
      assert conn.halted
      assert redirected_to(conn) == "/users/login"
      assert get_flash(conn, :error) == "You must login to access this page."
    end

    test "stores the path to redirect to on GET", %{conn: conn} do
      halted_conn =
        %{conn | request_path: "/foo?bar"}
        |> fetch_flash()
        |> UserAuth.require_authenticated_user([])

      assert halted_conn.halted
      assert get_session(halted_conn, :user_return_to) == "/foo?bar"

      halted_conn =
        %{conn | request_path: "/foo?bar", method: "POST"}
        |> fetch_flash()
        |> UserAuth.require_authenticated_user([])

      assert halted_conn.halted
      refute get_session(halted_conn, :user_return_to)
    end

    test "does not redirect if user is authenticated", %{conn: conn, user: user} do
      conn = conn |> assign(:current_user, user) |> UserAuth.require_authenticated_user([])
      refute conn.halted
      refute conn.status
    end
  end
end
