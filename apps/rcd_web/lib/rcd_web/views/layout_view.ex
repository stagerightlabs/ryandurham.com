defmodule RcdWeb.LayoutView do
  use RcdWeb, :view

  def gravatar_url(%{email: email}, size \\ "80") do
    email = String.downcase(email) |> String.trim()
    hash = :crypto.hash(:md5, email) |> Base.encode16(case: :lower)

    "https://www.gravatar.com/avatar/" <> hash <> "?s=" <> size <> "&d=mp"
  end

  def desktop_nav_button_classes(conn, label, extra \\ "") do
    if path_contains(conn, label) do
      "px-3 py-2 rounded-md font-medium leading-5 text-owl-900 dark:text-owl-200 bg-owl-300 dark:bg-owl-700 transition duration-150 ease-in-out " <>
        extra
    else
      "px-3 py-2 rounded-md font-medium leading-5 text-owl-900 dark:text-owl-400 dark-hover:text-owl-200  hover:bg-owl-200 dark-hover:bg-owl-800 transition duration-150 ease-in-out " <>
        extra
    end
  end

  def mobile_nav_button_classes(conn, label, extra \\ "") do
    if path_contains(conn, label) do
      "block px-3 py-2 rounded-md text-base font-medium text-owl-900 dark:text-owl-200 bg-owl-300 dark:bg-owl-700 transition duration-150 ease-in-out " <>
        extra
    else
      "block px-3 py-2 rounded-md text-base font-medium text-owl-900 dark:text-owl-400 dark-hover:text-owl-200  hover:bg-owl-200 dark-hover:bg-owl-800 transition duration-150 ease-in-out " <>
        extra
    end
  end

  def path_contains(conn, label) do
    Enum.member?(conn.path_info, label)
  end

  def tab_classes(selected, extra \\ "") do
    case selected do
      true ->
        "py-4 px-1 text-center border-b-2 border-owl-400 font-medium text-sm leading-5 text-owl-400 hover:text-owl-400 focus:outline-none focus:text-owl-400 focus:owl-400 " <>
          extra

      false ->
        "py-4 px-1 text-center border-b-2 border-transparent font-medium text-sm leading-5 text-owl-500 hover:text-owl-400 hover:border-owl-400 focus:outline-none focus:text-gray-700 focus:border-gray-300 " <>
          extra
    end
  end
end
