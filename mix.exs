defmodule Cqrs.MixProject do
  use Mix.Project

  def project do
    [
      app: :cqrs,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Cqrs.Application, []},
      extra_applications: [
        :logger,
        :eventstore
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commanded, "~> 0.19"},
      {:jason, "~> 1.1"},
      {:commanded_eventstore_adapter, "~> 0.6"},
      {:elixir_uuid, "~> 1.2"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:commanded_ecto_projections, "~> 0.8"}

    ]
  end
end
