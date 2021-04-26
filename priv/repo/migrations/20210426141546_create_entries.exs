defmodule DbProj.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :drugTesting, :boolean, default: false, null: false
      add :continuousDrugTesting, :boolean, default: false, null: false
      add :additionalNotes, :text
      add :user_id, references(:users, on_delete: :nothing)
      add :company_id, references(:companies, on_delete: :nothing)
      add :coopterm_id, references(:coopterms, on_delete: :nothing)

      timestamps()
    end

    create index(:entries, [:user_id])
    create index(:entries, [:company_id])
    create index(:entries, [:coopterm_id])
  end
end
