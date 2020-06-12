defmodule RcdWeb.JavascriptChannel do
  use Phoenix.Channel

  def join("js:" <> _token, _message, socket) do
    {:ok, socket}
  end
end
