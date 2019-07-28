defmodule Cqrs.Router do
  use Commanded.Commands.Router

  alias Cqrs.Commands.{ExpendMoney, AddMoney}
  alias Cqrs.Aggregate.Account

  dispatch [ExpendMoney, AddMoney], to: Account, identity: :account
end
