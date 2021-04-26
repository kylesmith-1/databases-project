defmodule DbProj.Coopterms.Coopterm do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coopterms" do
    field :term, :string

    belongs_to :entries, DbProj.Entries.Entry

    

    timestamps()
  end

  @doc false
  def changeset(coopterm, attrs) do
    coopterm
    |> cast(attrs, [:term])
    |> validate_required([:term])
  end
end
