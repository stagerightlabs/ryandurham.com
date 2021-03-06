defmodule RcdWeb.BookController do
  use RcdWeb, :controller

  alias Library.Authors
  alias Library.Books
  alias Library.Books.Book
  alias Library.Repo

  plug :put_layout, {RcdWeb.LayoutView, "library.html"}

  def index(conn, _params) do
    books =
      Books.list_books()
      |> Enum.group_by(fn book -> String.first(book.sortable_title) |> String.downcase() end)
      |> Enum.map(fn {letter, group} ->
        %{
          letter: String.upcase(letter),
          group: group,
          final: List.last(group)
        }
      end)

    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    changeset = Books.change_book(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    case Books.create_book(book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book.slug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"slug" => slug}) do
    book =
      Books.get_book_by_slug!(slug)
      |> Repo.preload(:authors)
      |> Repo.preload(:completions)

    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"slug" => slug}) do
    book =
      Books.get_book_by_slug!(slug)
      |> Repo.preload(:authors)

    changeset = Books.change_book(book)
    render(conn, "edit.html", book: book, changeset: changeset, authors: book.authors)
  end

  def update(conn, %{"slug" => slug, "book" => book_params, "authors" => authors}) do
    book =
      Books.get_book_by_slug!(slug)
      |> Repo.preload(:authors)

    authors =
      Enum.map(authors, fn slug ->
        Authors.get_author_by_slug(slug)
      end)

    Books.replace_book_authors(book, authors)

    case Books.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Book updated successfully.")
        |> redirect(to: Routes.book_path(conn, :show, book.slug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def update(conn, %{"slug" => slug, "book" => book_params}) do
    update(conn, %{"slug" => slug, "book" => book_params, "authors" => []})
  end

  def delete(conn, %{"slug" => slug}) do
    book = Books.get_book_by_slug!(slug)
    {:ok, _book} = Books.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end
end
