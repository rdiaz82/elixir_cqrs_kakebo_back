defmodule Cqrs.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # Start the Ecto repository
      supervisor(Cqrs.Repo, []),
      supervisor(Cqrs.Projectors.Supervisor, [])
    ]

    opts = [strategy: :one_for_one, name: Cqrs.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
