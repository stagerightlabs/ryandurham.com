defmodule Library.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :sortable_title, :string
      add :slug, :string
      add :year, :integer
      add :isbn13, :string
      add :purchase_link, :string
      add :rating, :integer
      add :thoughts, :text
      add :category, :string

      timestamps()
    end

  end
end
