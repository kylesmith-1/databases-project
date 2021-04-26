defmodule DbProj.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string, null: false
      add :location, :string, null: false

      timestamps()
    end

  end
end
