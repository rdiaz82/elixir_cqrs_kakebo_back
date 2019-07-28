use Mix.Config

config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "postgres",
  hostname: "localhost",
  pool_size: 10

config :cqrs, Cqrs.Repo,
  migration_timestamps: [type: :utc_datetime_usec],
  username: "postgres",
  password: "postgres",
  database: "readmodel",
  hostname: "localhost"
