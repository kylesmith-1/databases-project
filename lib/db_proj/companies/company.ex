defmodule DbProj.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :location, :string
    field :name, :string

    has_many :entries, DbProj.Entries.Entry

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :location])
    |> validate_required([:name, :location])
  end
end
