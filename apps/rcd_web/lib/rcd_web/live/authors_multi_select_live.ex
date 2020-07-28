defmodule RcdWeb.AuthorsMultiSelectLive do
  use Phoenix.LiveView

  alias Library.Authors

  def mount(_params, %{"user_token" => token, "authors" => authors}, socket) do
    socket =
      assign(socket,
        label: "Authors",
        authors: authors,
        query: "",
        results: [],
        result_length: 0,
        highlighted: 0,
        back_channel: "js:" <> Base.encode64(token)
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div>
      <label>Authors:</label>
      <%= if not_empty(@authors) do %>
        <ul>
          <%= for author <- @authors do %>
            <li>
              <%= author.name %>
              <input type="hidden" name="authors[]" value="<%= author.slug %>" />
              <button
                type="button"
                phx-click="remove_author"
                phx-value-slug="<%= author.slug %>"
                title="Remove <%= author.name %>"
              >
                <%= Phoenix.View.render RcdWeb.IconsView, "_trashcan.html", class: "w-4 inline mb-1 dark:text-owl-400 text-owl-900" %>
              </button>
            </li>
          <% end %>
        </ul>
      <% else %>
        <p class="p-2"><em>No author selected</em></p>
        <input type="hidden" name="authors[]" value="" />
      <% end %>
      <input
        id="author-multi-select-input"
        type="text"
        value="<%= @query %>"
        autocomplete="off"
        placeholder="Select author..."
        phx-keyup="query_authors"
        phx-hook="AuthorMultiSelect"
        phx-debounce
      />
      <%= if not_empty(@results) do %>
        <ul
          class="list-none w-auto p-0 relative overflow-y-auto border rounded border-owl-600 bg-owl-100 dark:bg-owl-900 mt-1"
          id="author-multi-select-result-list"
        >
          <%= for {result, idx} <- Enum.with_index(@results) do %>
            <li
              class="py-1 px-3 text-owl-600 cursor-pointer rounded select-none hover:bg-owl-400 <%= if idx == @highlighted, do: 'bg-owl-400' %>"
              phx-click="selected"
              phx-value-slug="<%= result.slug %>"
            ><%= result.name %></li>
          <% end %>
        </ul>
      <% end %>
      <%= if empty(@results) && not_empty(@query) do %>
      <ul
        class="list-none w-auto p-0 relative overflow-y-auto border rounded border-owl-600 bg-owl-100 dark:bg-owl-900 mt-1"
        id="author-multi-select-result-list"
      >
        <li
          class="py-1 px-3 text-owl-600 cursor-pointer rounded select-none bg-owl-400"
        >
          Create new author: <%= @query %></em>
        </li>
      <% end %>
    </div>
    """
  end

  def handle_event("query_authors", %{"code" => "Escape"}, socket) do
    trigger_javascript(socket, "clear_input", %{id: "author-multi-select-input"})

    {:noreply, reset(socket)}
  end

  def handle_event("query_authors", %{"code" => "Enter"}, socket) do
    selection =
      case Enum.at(socket.assigns.results, socket.assigns.highlighted, nil) do
        nil ->
          Authors.create_author(%{name: socket.assigns.query})

        author ->
          {:ok, author}
      end

    case selection do
      {:ok, author} ->
        make_selection(author, socket)

      _ ->
        socket = assign(socket, query: "")
        {:ok, socket}
    end
  end

  def handle_event("query_authors", %{"code" => "ArrowDown"}, socket) do
    highlighted = socket.assigns.highlighted
    max_length = socket.assigns.result_length

    socket = assign(socket, highlighted: min(highlighted + 1, max_length))

    {:noreply, socket}
  end

  def handle_event("query_authors", %{"code" => "ArrowUp"}, socket) do
    highlighted = socket.assigns.highlighted

    socket = assign(socket, highlighted: max(highlighted - 1, 0))

    {:noreply, socket}
  end

  def handle_event("query_authors", %{"value" => query} do
    handle_event("query_authors", %{"value" => query, "code" => nil, "key" => nil})
  end

  def handle_event("query_authors", %{"value" => query, "code" => _code, "key" => _key}, socket) do
    socket =
      case String.length(query) do
        0 ->
          assign(socket, results: [], result_length: 0)

        _length ->
          send(self(), {:search_authors, query})
          assign(socket, query: query)
      end

    {:noreply, socket}
  end

  def handle_event("selected", %{"slug" => slug}, socket) do
    selection =
      Enum.filter(socket.assigns.results, fn a -> a.slug == slug end)
      |> List.first()

    make_selection(selection, socket)
  end

  def handle_event("blur", _, socket) do
    socket =
      assign(socket,
        results: [],
        result_length: 0,
        query: ""
      )

    {:noreply, socket}
  end

  def handle_event("remove_author", %{"slug" => slug}, socket) do
    index = Enum.find_index(socket.assigns.authors, fn author -> author.slug == slug end)

    socket =
      assign(socket,
        authors: List.delete_at(socket.assigns.authors, index)
      )

    trigger_javascript(socket, "focus_input", %{id: "author-multi-select-input"})

    {:noreply, socket}
  end

  def handle_info({:search_authors, query}, socket) do
    results = Authors.query_authors(query)

    socket =
      assign(socket,
        results: results,
        result_length: length(results),
        highlighted: 0
      )

    {:noreply, socket}
  end

  defp not_empty(string) when is_binary(string) do
    String.length(string) > 0
  end

  defp not_empty(enum) do
    length(enum) > 0
  end

  defp empty(string) when is_binary(string) do
    String.length(string) == 0
  end

  defp empty(enum) do
    length(enum) == 0
  end

  defp reset(socket) do
    assign(socket, query: "empty", results: [])
  end

  defp make_selection(selection, socket) do
    socket =
      assign(socket,
        authors: socket.assigns.authors ++ [selection],
        query: "",
        results: []
      )

    trigger_javascript(socket, "clear_input", %{id: "author-multi-select-input"})

    {:noreply, socket}
  end

  defp trigger_javascript(socket, event, payload) do
    RcdWeb.Endpoint.broadcast!(socket.assigns.back_channel, event, payload)
  end
end
