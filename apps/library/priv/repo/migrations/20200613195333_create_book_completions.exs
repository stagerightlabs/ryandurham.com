defmodule Library.Repo.Migrations.CreateBookCompletions do
  use Ecto.Migration

  def change do
    create table(:book_completions) do
      add :book_id, references(:books)
      add :completed_at, :utc_datetime
    end
  end
end
