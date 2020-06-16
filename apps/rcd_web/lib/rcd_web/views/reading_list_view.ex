defmodule RcdWeb.ReadingListView do
  use RcdWeb, :view

  def author_list(authors) do
    Enum.map_join(authors, ", ", &(&1.name))
  end
end
