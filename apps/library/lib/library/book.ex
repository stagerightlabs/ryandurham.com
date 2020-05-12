defmodule Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :category, :string
    field :isbn13, :string
    field :purchase_link, :string
    field :rating, :integer
    field :slug, :string
    field :sortable_title, :string
    field :thoughts, :string
    field :title, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :sortable_title, :slug, :year, :isbn13, :purchase_link, :rating, :thoughts, :category])
    |> validate_required([:title, :sortable_title, :slug, :year, :isbn13, :purchase_link, :rating, :thoughts, :category])
  end
end
