defmodule Library.Author do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  import Utilities, only: [last_index: 2, string_to_slug: 1]

  alias Library.Repo

  schema "authors" do
    field :name, :string
    field :slug, :string
    field :sortable_name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def create_changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :url])
    |> validate_required([:name])
    |> maybe_add_sortable_name()
    |> maybe_add_slug()
    |> maybe_add_suffix_to_slug()
    |> unique_constraint(:slug)
  end

  @doc false
  def update_changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :sortable_name, :slug, :url])
    |> validate_required([:name, :sortable_name, :slug])
    |> unique_constraint(:slug)
  end

  defp maybe_add_sortable_name(changeset) do
    case name = get_change(changeset, :name) do
      nil -> changeset
      _ ->
        [first, last] =
          name
          |> String.split_at(last_index(name, " "))
          |> Tuple.to_list()
          |> Enum.map(fn str -> String.trim(str) end)

          changeset
        |> put_change(:sortable_name, last <> ", " <> first)
    end
  end

  defp maybe_add_slug(changeset) do
    case name = get_change(changeset, :name) do
      nil -> changeset
      _ ->
        changeset
        |> put_change(:slug, string_to_slug(name))
    end
  end

  defp maybe_add_suffix_to_slug(changeset) do
    case slug = get_change(changeset, :slug) do
      nil -> changeset
      _ ->
        count = Repo.one(from a in __MODULE__, where: a.slug == ^slug, select: count())
        if count > 0 do
          put_change(changeset, :slug, slug <> "-" <> to_string(count))
        else
          changeset
        end
    end
  end
end
