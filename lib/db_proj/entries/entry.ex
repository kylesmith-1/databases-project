defmodule DbProj.Entries.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :additionalNotes, :string
    field :continuousDrugTesting, :boolean, default: false
    field :drugTesting, :boolean, default: false
    field :user_id, :id
    field :company_id, :id
    field :term, :id

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:drugTesting, :continuousDrugTesting, :additionalNotes])
    |> validate_required([:drugTesting, :continuousDrugTesting, :additionalNotes])
  end
end
