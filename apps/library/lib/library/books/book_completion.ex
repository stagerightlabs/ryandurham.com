defmodule Admin.Library.BookCompletion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_completions" do
    field :completed_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(book_completion, attrs) do
    book_completion
    |> cast(attrs, [:completed_at])
    |> validate_required([:completed_at])
  end
end
