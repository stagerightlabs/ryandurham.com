defmodule RcdWeb.LayoutView do
  use RcdWeb, :view

  def gravatar_url(%{email: email}, size \\ "80") do
    email = String.downcase(email) |> String.trim()
    hash = :crypto.hash(:md5, email) |> Base.encode16(case: :lower)

    "https://www.gravatar.com/avatar/" <> hash <> "?s=" <> size <> "&d=mp"
  end

  def desktop_nav_button_classes(conn, action, extra \\ "") do
    if action_name(conn) == action do
      "px-3 py-2 rounded-md font-medium leading-5 text-owl-900 dark:text-owl-200 bg-owl-300 dark:bg-owl-700 transition duration-150 ease-in-out " <>
        extra
    else
      "px-3 py-2 rounded-md font-medium leading-5 text-owl-900 dark:text-owl-400 dark-hover:text-owl-200  hover:bg-owl-200 dark-hover:bg-owl-800 transition duration-150 ease-in-out " <>
        extra
    end
    #
  end

  def mobile_nav_button_classes(conn, action, extra \\ "") do
    if action_name(conn) == action do
      "block px-3 py-2 rounded-md text-base font-medium text-owl-900 dark:text-owl-200 bg-owl-300 dark:bg-owl-700 transition duration-150 ease-in-out " <>
        extra
    else
      "block px-3 py-2 rounded-md text-base font-medium text-owl-900 dark:text-owl-400 dark-hover:text-owl-200  hover:bg-owl-200 dark-hover:bg-owl-800 transition duration-150 ease-in-out " <>
        extra
    end
  end
end
