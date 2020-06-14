defmodule RcdWeb.BookCompletionController do
  use RcdWeb, :controller

  alias Library.Books
  alias Library.Repo

  def create(conn, %{"slug" => slug, "date" => date}) do
    book =
      Books.get_book_by_slug!(slug)
      |> Repo.preload(:completions)

    case Timex.parse(date, "{YYYY}-{0M}-{0D}") do
      {:ok, date} ->
        current_time = Timex.now("America/Los_Angeles")|>DateTime.to_time()
        date =
          Timex.to_datetime(date, "America/Los_Angeles")
          |> Timex.set(time: current_time)

        Books.create_book_completion(book, date)

        conn
        |> redirect(to: Routes.book_path(conn, :show, book.slug))

      _ ->
        conn
        |> put_flash(:error, "The completion date could not be parsed.")
        |> redirect(to: Routes.book_path(conn, :show, book.slug))
    end
  end

  def delete(conn, %{"slug" => slug, "id" => id}) do
    Books.get_completion!(id)
    |> Books.remove_book_completion()

    conn
    |> put_flash(:success, "Completion record removed.")
    |> redirect(to: Routes.book_path(conn, :show, slug))
  end
end
