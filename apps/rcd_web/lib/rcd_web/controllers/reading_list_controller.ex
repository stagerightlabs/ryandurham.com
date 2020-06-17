defmodule RcdWeb.ReadingListController do
  use RcdWeb, :controller

  alias Library.Books

  def index(conn, _params) do
    readings =
      Books.list_completions()
      |> Enum.group_by(fn c ->
        {:ok, year} = Timex.format(c.completed_at, "{YYYY}")
        year
      end)
      |> Enum.reverse()

    render(conn, "index.html", readings: readings, page_title: "The Big List")
  end
end
