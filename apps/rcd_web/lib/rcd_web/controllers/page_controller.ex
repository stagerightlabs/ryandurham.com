defmodule RcdWeb.PageController do
  use RcdWeb, :controller

  alias Library.Books

  def index(conn, _params) do
    year = Timex.now()
      |>Timex.format!("{YYYY}")

    readings = Books.completions_for_year(year)

    render(conn, "index.html", year: year, readings: readings)
  end

  def dashboard(conn, _params) do
    render(conn, "dashboard.html")
  end

  def todo(conn, _params) do
    render(conn, "todo.html")
  end
end
