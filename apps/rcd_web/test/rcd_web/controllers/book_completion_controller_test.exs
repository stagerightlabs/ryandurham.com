defmodule RcdWeb.BookCompletionControllerTest do
  use RcdWeb.ConnCase

  alias Library.Books
  alias Library.Repo

  def fixture(:book) do
    {:ok, book} = Books.create_book(%{title: "Some Title"})
    book
  end

  def fixture(:completion, book) do
    {:ok, completion} = Books.create_book_completion(book, "2010-06-01 15:46:35-07")
    completion
  end

  setup %{conn: conn} do
    # Explicitly get a connection before each test
    # https://hexdocs.pm/ecto_sql/Ecto.Adapters.SQL.Sandbox.html
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Admin.Repo)
    # Setting the shared mode must be done only after checkout
    Ecto.Adapters.SQL.Sandbox.mode(Admin.Repo, {:shared, self()})

    RcdWeb.ConnCase.register_and_login_user(%{conn: conn})
  end

  describe "create book completion" do
    setup [:create_book]

    test "redirects to book page when data is valid", %{conn: conn, book: book} do
      conn = post(conn, Routes.book_completion_path(conn, :create, book.slug), date: "2020-01-01")

      assert %{slug: slug} = redirected_params(conn)
      assert redirected_to(conn) == Routes.book_path(conn, :show, book.slug)

      book = Repo.preload(book, :completions)
      assert length(book.completions) == 1
    end

    test "renders errors when data is invalid", %{conn: conn, book: book} do
      conn = post(conn, Routes.book_completion_path(conn, :create, book.slug), date: "20200101")

      assert redirected_to(conn) == Routes.book_path(conn, :show, book.slug)
      assert get_flash(conn) == %{"error" => "The completion date could not be parsed."}

      book = Repo.preload(book, :completions)
      assert length(book.completions) == 0
    end
  end

  describe "delete completion" do
    setup [:create_book]

    test "deletes chosen completion", %{conn: conn, book: book} do
      completion = fixture(:completion, book)
      conn = delete(conn, Routes.book_completion_path(conn, :delete, book.slug, completion.id))
      assert redirected_to(conn) == Routes.book_path(conn, :show, book.slug)

      assert_error_sent 404, fn ->
        get(conn, Routes.book_path(conn, :show, book))
      end
    end
  end

  defp create_book(_) do
    book = fixture(:book)
    %{book: book}
  end
end
