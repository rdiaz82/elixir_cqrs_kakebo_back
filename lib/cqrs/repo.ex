defmodule Cqrs.Repo do
  use Ecto.Repo,
  otp_app: :cqrs,
  adapter: Ecto.Adapters.Postgres

end
