defmodule Library.Repo.Migrations.CreateAuthorsBooksTable do
  use Ecto.Migration

  def change do
    create table(:authors_books, primary_key: false) do
      add :author_id, references(:authors)
      add :book_id, references(:books)
    end

    create unique_index(:authors_books, [:author_id, :book_id])
  end
end
