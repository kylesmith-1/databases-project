defmodule DbProj.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstName, :string, null: false
      add :lastName, :string, null: false
      add :username, :string, null: false
      add :password, :string, null: false
      add :email, :string, null: false
      add :dateOfBirth, :date, null: false

      timestamps()
    end

  end
end
