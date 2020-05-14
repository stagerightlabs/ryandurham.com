defmodule Library.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :sortable_title, :string, null: false
      add :slug, :string, null: false
      add :year, :smallint, null: true
      add :isbn13, :string, null: true
      add :purchase_link, :string, null: true
      add :rating, :smallint, null: true
      add :thoughts, :text, null: true
      add :category, :string, null: false, default: "Non-Fiction"

      timestamps()
    end

    create unique_index(:books, [:slug])
  end
end
