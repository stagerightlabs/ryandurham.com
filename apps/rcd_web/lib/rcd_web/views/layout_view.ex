defmodule RcdWeb.LayoutView do
  use RcdWeb, :view

  def gravatar_url(%{email: email}, size \\ "80") do
    email = String.downcase(email) |> String.trim()
    hash = :crypto.hash(:md5, email) |> Base.encode16(case: :lower)

    "https://www.gravatar.com/avatar/" <> hash <> "?s=" <> size <> "&d=mp"
  end

  def desktop_nav_button_classes(conn, action, extra \\ "") do
    if action_name(conn) == action do
      "px-3 py-2 rounded-md font-medium leading-5 text-primary bg-700 focus:outline-none focus:text-primary focus:bg-500 transition duration-150 ease-in-out " <>
        extra
    else
      "px-3 py-2 rounded-md font-medium leading-5 text-default hover:text-primary hover:bg-500 focus:outline-none focus:text-primary focus:bg-500 transition duration-150 ease-in-out " <>
        extra
    end
  end

  def mobile_nav_button_classes(conn, action, extra \\ "") do
    if action_name(conn) == action do
      "block px-3 py-2 rounded-md text-base font-medium text-primary bg-700 focus:outline-none transition duration-150 ease-in-out " <>
        extra
    else
      "block px-3 py-2 rounded-md text-base font-medium text-default hover:text-primary hover:bg-500 focus:outline-none focus:text-primary focus:bg-500 transition duration-150 ease-in-out " <>
        extra
    end
  end
end
