defmodule RcdWeb.BookControllerTest do
  use RcdWeb.ConnCase

  alias Library.Authors
  alias Library.Books
  alias Library.Repo

  @create_attrs %{title: "Some Title"}
  @update_attrs %{
    category: "some updated category",
    isbn13: "some updated isbn13",
    purchase_link: "some updated purchase_link",
    rating: 43,
    slug: "some-updated-slug",
    sortable_title: "some updated sortable_title",
    thoughts: "some updated thoughts",
    title: "some updated title",
    year: 43
  }
  @invalid_attrs %{
    category: nil,
    isbn13: nil,
    purchase_link: nil,
    rating: nil,
    slug: nil,
    sortable_title: nil,
    thoughts: nil,
    title: nil,
    year: nil
  }

  def fixture(:book) do
    {:ok, book} = Books.create_book(@create_attrs)
    book
  end

  def fixture(:author) do
    {:ok, author} =
      Authors.create_author(%{
        name: "some name",
        slug: "some slug",
        sortable_name: "some sortable_name",
        url: "some url"
      })

    author
  end

  setup %{conn: conn} do
    # Explicitly get a connection before each test
    # https://hexdocs.pm/ecto_sql/Ecto.Adapters.SQL.Sandbox.html
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Admin.Repo)
    # Setting the shared mode must be done only after checkout
    Ecto.Adapters.SQL.Sandbox.mode(Admin.Repo, {:shared, self()})

    RcdWeb.ConnCase.register_and_login_user(%{conn: conn})
  end

  describe "index" do
    test "lists all books", %{conn: conn} do
      conn = get(conn, Routes.book_path(conn, :index))
      assert html_response(conn, 200) =~ "Books"
    end
  end

  describe "new book" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.book_path(conn, :new))
      assert html_response(conn, 200) =~ "New Book"
    end
  end

  describe "create book" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.book_path(conn, :create), book: @create_attrs)

      assert %{slug: slug} = redirected_params(conn)
      assert redirected_to(conn) == Routes.book_path(conn, :show, slug)

      conn = get(conn, Routes.book_path(conn, :show, slug))
      assert html_response(conn, 200) =~ @create_attrs.title
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.book_path(conn, :create), book: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Book"
    end
  end

  describe "edit book" do
    setup [:create_book]

    test "renders form for editing chosen book", %{conn: conn, book: book} do
      conn = get(conn, Routes.book_path(conn, :edit, book.slug))
      assert html_response(conn, 200) =~ "Edit Book"
    end
  end

  describe "update book" do
    setup [:create_book, :create_author]

    test "redirects when data is valid", %{conn: conn, book: book} do
      conn = put(conn, Routes.book_path(conn, :update, book.slug), book: @update_attrs)
      assert redirected_to(conn) == Routes.book_path(conn, :show, @update_attrs.slug)

      conn = get(conn, Routes.book_path(conn, :show, @update_attrs.slug))
      assert html_response(conn, 200) =~ "some updated category"
    end

    test "assigns an author to a book", %{conn: conn, book: book, author: author} do
      book = Repo.preload(book, :authors)
      assert length(book.authors) == 0

      put(conn, Routes.book_path(conn, :update, book.slug),
        book: Map.from_struct(book),
        authors: [author.slug]
      )

      book =
        Books.get_book_by_slug!(book.slug)
        |> Repo.preload(:authors)

      assert book.authors == [author]
    end

    test "removes an author from a book", %{conn: conn, book: book, author: author} do
      Books.add_author_to_book(book, author)
      book = Repo.preload(book, :authors)
      assert length(book.authors) == 1

      put(conn, Routes.book_path(conn, :update, book.slug),
        book: Map.from_struct(book),
        authors: [""]
      )

      book =
        Books.get_book_by_slug!(book.slug)
        |> Repo.preload(:authors)

      assert book.authors == []
    end

    test "renders errors when data is invalid", %{conn: conn, book: book} do
      conn = put(conn, Routes.book_path(conn, :update, book.slug), book: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Book"
    end
  end

  describe "delete book" do
    setup [:create_book]

    test "deletes chosen book", %{conn: conn, book: book} do
      conn = delete(conn, Routes.book_path(conn, :delete, book.slug))
      assert redirected_to(conn) == Routes.book_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.book_path(conn, :show, book))
      end
    end
  end

  defp create_book(_) do
    book = fixture(:book)
    %{book: book}
  end

  defp create_author(_) do
    author = fixture(:author)
    %{author: author}
  end
end
