defmodule DbProj.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstName, :string
      add :lastName, :string
      add :username, :string
      add :password, :string
      add :email, :string
      add :dateOfBirth, :date

      timestamps()
    end

  end
end
