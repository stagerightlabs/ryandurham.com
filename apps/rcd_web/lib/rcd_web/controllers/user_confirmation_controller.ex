defmodule RcdWeb.UserConfirmationController do
  use RcdWeb, :controller

  alias Admin.Accounts

  def new(conn, _params) do
    render(conn, "new.html", page_title: "Confirm Your E-mail Account")
  end

  def create(conn, %{"user" => %{"email" => email}}) do
    if user = Accounts.get_user_by_email(email) do
      Accounts.deliver_user_confirmation_instructions(
        user,
        &Routes.user_confirmation_url(conn, :confirm, &1)
      )
    end

    # Regardless of the outcome, show an impartial success/error message.
    conn
    |> put_flash(
      :info,
      "If your e-mail is in our system and it has not been confirmed yet, " <>
        "you will receive an e-mail with instructions shortly."
    )
    |> redirect(to: Routes.user_session_path(RcdWeb.Endpoint, :new))
  end

  # Do not login the user after confirmation to avoid a
  # leaked token giving the user access to the account.
  def confirm(conn, %{"token" => token}) do
    case Accounts.confirm_user(token) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Account confirmed successfully.")
        |> redirect(to: Routes.user_session_path(RcdWeb.Endpoint, :new))

      :error ->
        conn
        |> put_flash(:error, "Confirmation link is invalid or it has expired.")
        |> redirect(to: Routes.user_session_path(RcdWeb.Endpoint, :new))
    end
  end
end
