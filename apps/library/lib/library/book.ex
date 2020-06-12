defmodule Library.Book do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  import Utilities, only: [string_to_slug: 1]

  alias Library.Repo

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
    many_to_many :authors, Library.Author, join_through: "authors_books", on_replace: :delete

    timestamps()
  end

  @doc false
  def create_changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :sortable_title, :slug])
    |> validate_required([:title])
    |> maybe_add_sortable_title()
    |> maybe_add_slug()
    |> maybe_add_suffix_to_slug()
    |> unique_constraint(:slug)
  end

  @doc false
  def update_changeset(book, attrs) do
    book
    |> cast(attrs, [
      :title,
      :sortable_title,
      :slug,
      :year,
      :isbn13,
      :purchase_link,
      :rating,
      :thoughts,
      :category
    ])
    |> validate_required([:title, :sortable_title, :slug, :category])
  end

  def changeset_authors(book, author_list) do
    author_list =
      case author_list do
        [nil] -> []
        author_list -> author_list
      end

    change(book)
    |> put_assoc(:authors, author_list)
  end

  # Add a sortable title to the change set if it is needed.
  defp maybe_add_sortable_title(changeset) do
    case get_change(changeset, :title) do
      "A " <> title -> put_change(changeset, :sortable_title, title)
      "a " <> title -> put_change(changeset, :sortable_title, title)
      "The " <> title -> put_change(changeset, :sortable_title, title)
      "the " <> title -> put_change(changeset, :sortable_title, title)
      title -> put_change(changeset, :sortable_title, title)
    end
  end

  # Add a slug to the changeset if it is needed.
  defp maybe_add_slug(changeset) do
    case title = get_change(changeset, :title) do
      nil ->
        changeset

      _ ->
        changeset
        |> put_change(:slug, string_to_slug(title))
    end
  end

  # Add a unique index to the end of a slug if it is a duplicate.
  defp maybe_add_suffix_to_slug(changeset) do
    case slug = get_change(changeset, :slug) do
      nil ->
        changeset

      _ ->
        count = Repo.one(from b in __MODULE__, where: b.slug == ^slug, select: count())

        if count > 0 do
          put_change(changeset, :slug, slug <> "-" <> to_string(count))
        else
          changeset
        end
    end
  end
end
