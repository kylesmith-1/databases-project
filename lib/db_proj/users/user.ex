defmodule DbProj.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :dateOfBirth, :date
    field :email, :string
    field :firstName, :string
    field :lastName, :string
    field :password, :string
    field :username, :string

    belongs_to :entries, DbProj.Entries.Entry

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstName, :lastName, :username, :password, :email, :dateOfBirth])
    |> validate_required([:firstName, :lastName, :username, :password, :email, :dateOfBirth])
  end
end
