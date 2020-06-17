defmodule RcdWeb.PageController do
  use RcdWeb, :controller

  alias Library.Books

  @doc """
  Render the home page.
  """
  def index(conn, _params) do
    year = Timex.now()
      |>Timex.format!("{YYYY}")

    readings = Books.completions_for_year(year)

    render(conn, "index.html", year: year, readings: readings)
  end

  @doc """
  Render the dashboard.
  """
  def dashboard(conn, _params) do
    render(conn, "dashboard.html")
  end

  @doc """
  Render the todo page.
  """
  def todo(conn, _params) do
    render(conn, "todo.html")
  end

  @doc """
  Render the colophon page.
  """
  def colophon(conn, _params) do
    render(conn, "colophon.html")
  end
end
