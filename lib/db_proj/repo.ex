defmodule DbProj.Repo do
  use Ecto.Repo,
    otp_app: :db_proj,
    adapter: Ecto.Adapters.Postgres
end
