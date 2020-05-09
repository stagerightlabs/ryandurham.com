defmodule Utilities do
  @moduledoc """
  General utility methods that may be useful across domains.
  """

  @doc """
  Find the index of the last instance of a value in an enumerable.

  ## Examples

      iex> Utilities.last_index([1, 2, 3, 1, 2, 3], 2)
      4

      iex> Utilities.last_index("abcdabcd", "c")
      6

      iex> Utilities.last_index([1, 2, 3, 1, 2, 3], 4)
      nil

      iex> Utilities.last_index("abcdabcd", "e")
      nil

      iex> Utilities.last_index(nil, "something")
      nil
  """
  def last_index(enum, value) when is_binary(enum) do
    String.graphemes(enum)
    |> last_index(value)
  end

  def last_index(enum, _value) when is_nil(enum) do
    nil
  end

  def last_index(enum, value) do
    enum
    |> Enum.with_index()
    |> Enum.map(fn {v, k} ->
      case v == value do
        true -> k
        false -> nil
      end
    end)
    |> Enum.filter(fn v -> v end)
    |> Enum.reverse()
    |> List.first()
  end

  @doc """
  Convert a string to a slug
  https://elixirforum.com/t/how-to-replace-accented-letters-with-ascii-letters/539/11

  ## Examples

      iex> Utilities.string_to_slug("Hello World")
      "hello-world"

      iex> Utilities.string_to_slug("  Hello World   ")
      "hello-world"

      iex> Utilities.string_to_slug("Héllö Wörld")
      "hello-world"

      iex> Utilities.string_to_slug(nil)
      ""

      iex> Utilities.string_to_slug("")
      ""

  """
  def string_to_slug(str) when is_binary(str) do
    str
    |> :unicode.characters_to_nfd_binary()
    |> String.trim()
    |> String.downcase()
    |> String.replace(~r/[^a-z-\s]/u, "")
    |> String.replace(~r/\s/, "-")
  end

  def string_to_slug(_str) do
    ""
  end
end
