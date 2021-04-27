defmodule DbProj.Entries.Entry do
  use Ecto.Schema
  import Ecto.Changeset
  require Logger

  schema "entries" do
    field :additionalNotes, :string
    field :continuousDrugTesting, :boolean, default: false
    field :drugTesting, :boolean, default: false
    field :user_id, :id
    field :company_id, :id
    field :coopterm_id, :id
    #has_many :users, PhotoBlog.Posts.Post
    #has_many :users, PhotoBlog.Posts.Post
    #has_many :users, PhotoBlog.Posts.Post
    #belongs_to :coopterms, DbProj.Coopterms.Coopterm
    #belongs_to :users, DbProj.Users.User
    #belongs_to :companies, DbProj.Companies.Company



    timestamps()
  end

  #:additionalNotes, :user_id, :company_id, :coopterm_id
  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:drugTesting, :continuousDrugTesting, :additionalNotes, :user_id, :company_id, :coopterm_id])
    |> validate_required([:drugTesting, :continuousDrugTesting, :additionalNotes, :user_id, :company_id, :coopterm_id])
  end
end
