defmodule RcdWeb.LayoutView do
  use RcdWeb, :view

  def gravatar_url(%{email: email}, size \\ "80") do
    email = String.downcase(email)|>String.trim()
    hash = :crypto.hash(:md5, email)|> Base.encode16(case: :lower)

    "https://www.gravatar.com/avatar/" <> hash <> "?s=" <> size <> "&d=mp"
  end
end
