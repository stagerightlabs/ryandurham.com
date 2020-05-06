defmodule Library.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :name, :string
    field :slug, :string
    field :sortable_name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :sortable_name, :slug, :url])
    |> validate_required([:name, :sortable_name, :slug, :url])
  end
end
