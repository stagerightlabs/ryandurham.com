defmodule Library.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :sortable_name, :string
      add :slug, :string
      add :url, :string

      timestamps()
    end

    create unique_index(:authors, [:slug])
  end
end
