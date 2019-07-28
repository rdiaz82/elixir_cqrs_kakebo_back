use Mix.Config

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :cqrs, ecto_repos: [Cqrs.Repo]

config :commanded_ecto_projections,
  repo: Cqrs.Repo

config :commanded, Cqrs.Aggregate.Account,
  snapshot_every: 5,
  snapshot_version: 1

config :cqrs, Cqrs.Repo,
  migration_timestamps: [type: :utc_datetime_usec],
  username: "postgres",
  password: "postgres",
  database: "readmodel",
  hostname: "localhost"

import_config "#{Mix.env()}.exs"
