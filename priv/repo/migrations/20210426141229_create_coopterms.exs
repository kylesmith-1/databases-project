defmodule DbProj.Repo.Migrations.CreateCoopterms do
  use Ecto.Migration

  def change do
    create table(:coopterms) do
      add :term, :string, null: false

      timestamps()
    end

  end
end
