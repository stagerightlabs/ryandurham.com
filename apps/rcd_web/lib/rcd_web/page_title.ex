defmodule RcdWeb.PageTitle do
  @moduledoc """
  A page title helper.
  http://cloudless.studio/articles/27-implementing-page-specific-titles-in-phoenix
  """

  @suffix "RyanDurham.com"

  def page_title(assigns), do: assigns |> get |> put_suffix

  defp put_suffix(nil), do: @suffix
  defp put_suffix(title), do: title <> " - " <> @suffix

  defp get(%{ page_title: title}),  do: title
  defp get(_), do: nil
end
