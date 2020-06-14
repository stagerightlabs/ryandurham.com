defmodule Library.Books.Completion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_completions" do
    field :completed_at, :utc_datetime
    belongs_to :book, Library.Books.Book
  end

  @doc false
  def changeset(book_completion, attrs \\ %{}) do
    book_completion
    |> cast(attrs, [:completed_at, :book_id])
    |> validate_required([:completed_at, :book_id])
  end
end
