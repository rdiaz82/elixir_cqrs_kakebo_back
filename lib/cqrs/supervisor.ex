defmodule Cqrs.Supervisor do
  use Supervisor


  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_arg) do
    Supervisor.init([
      Cqrs.Projectors.Account
    ], strategy: :one_for_one)
  end
end
