defmodule Library.Books do
  @moduledoc """
  The Books context.
  """

  alias Library.Books.Book
  alias Library.Repo

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Gets a single book by slug.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book_by_slug!(slug), do: Repo.get_by!(Book, slug: slug)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Create a book, bypassing the creation validation rules.
  """
  def force_create_book(attrs \\ %{}) do
    %Book{}
    |> Book.update_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.update_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.update_changeset(book, attrs)
  end

  @doc """
  Add an author to a book.
  """
  def add_author_to_book(book, author) do
    book = Repo.preload(book, :authors)

    book
    |> Book.changeset_authors([author | book.authors])
    |> Repo.update()
  end

  @doc """
  Remove an author from a book
  """
  def remove_author_from_book(book, author) do
    book = Repo.preload(book, :authors)

    index =
      Enum.find_index(book.authors, fn a ->
        author.slug == a.slug
      end)

    book
    |> Book.changeset_authors(Enum.slice(book.authors, index, 1))
    |> Repo.update()
  end

  @doc """
  Replace the list of authors associated with a book.
  """
  def replace_book_authors(book, authors) when is_list(authors) do
    book = Repo.preload(book, :authors)

    book
    |> Book.changeset_authors(authors)
    |> Repo.update()
  end

  def replace_book_authors(book, author) do
    replace_book_authors(book, [author])
  end
end
