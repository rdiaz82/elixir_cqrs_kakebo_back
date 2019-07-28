defmodule Cqrs.Projectors.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, nil)
  end

  def init(_) do
    children = [
      # projections
      worker(Cqrs.Projectors.Account, [], id: :account),
      worker(Cqrs.Projectors.Survival, [], id: :survival),
      worker(Cqrs.Projectors.Leisure, [], id: :leisure),
      worker(Cqrs.Projectors.Other, [], id: :other)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
