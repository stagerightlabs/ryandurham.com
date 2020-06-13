defmodule Library.Authors do
  @moduledoc """
  The Authors context.
  """

  import Ecto.Query, warn: false
  alias Library.Repo

  alias Library.Authors.Author

  @doc """
  Returns the list of authors.

  ## Examples

      iex> list_authors()
      [%Author{}, ...]

  """
  def list_authors do
    Repo.all(from(a in Author, order_by: a.sortable_name))
  end

  @doc """
  Gets a single author.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!(123)
      %Author{}

      iex> get_author!(456)
      ** (Ecto.NoResultsError)

  """
  def get_author!(id), do: Repo.get!(Author, id)

  @doc """
  Gets a single author, queried by slug.

  Raises `Ecto.NoResultsError` if the Author does not exist.

  ## Examples

      iex> get_author!("slug")
      %Author{}

      iex> get_author!("invalid")
      ** (Ecto.NoResultsError)

  """
  def get_author_by_slug!(slug), do: Repo.get_by!(Author, slug: slug)

  @doc """
  Gets a single author, queried by slug.

  ## Examples

      iex> get_author("slug")
      %Author{}

      iex> get_author!("invalid")
      nil

  """
  def get_author_by_slug(slug), do: Repo.get_by(Author, slug: slug)

  @doc """
  Search for authors with a query string
  """
  def query_authors(term) do
    term = "%#{term}%"

    Repo.all(
      from(
        a in Author,
        where: ilike(a.name, ^term),
        order_by: a.sortable_name,
        limit: 20
      )
    )
  end

  @doc """
  Creates a author.

  ## Examples

      iex> create_author(%{field: value})
      {:ok, %Author{}}

      iex> create_author(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Create an author, bypassing the creation validation rules.
  """
  def force_create_author(attrs \\ %{}) do
    %Author{}
    |> Author.update_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a author.

  ## Examples

      iex> update_author(author, %{field: new_value})
      {:ok, %Author{}}

      iex> update_author(author, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.update_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a author.

  ## Examples

      iex> delete_author(author)
      {:ok, %Author{}}

      iex> delete_author(author)
      {:error, %Ecto.Changeset{}}

  """
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking author changes.

  ## Examples

      iex> change_author(author)
      %Ecto.Changeset{data: %Author{}}

  """
  def change_author(%Author{} = author, attrs \\ %{}) do
    Author.update_changeset(author, attrs)
  end
end
