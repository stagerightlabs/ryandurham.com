defmodule RcdWeb.PageController do
  use RcdWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
