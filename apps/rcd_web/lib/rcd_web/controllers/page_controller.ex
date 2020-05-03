defmodule RcdWeb.PageController do
  use RcdWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def dashboard(conn, _params) do
    render(conn, "dashboard.html")
  end

  def todo(conn, _params) do
    render(conn, "todo.html")
  end
end
