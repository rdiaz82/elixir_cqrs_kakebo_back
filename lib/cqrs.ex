defmodule Cqrs do
  alias Cqrs.Application
  alias Cqrs.Router

  alias Cqrs.Commands.AddMoney
  alias Cqrs.Commands.ExpendMoney


  def start do
    Application.start(:cqrs, [])
  end

  def addMoneyCommand(account, amount, concept) do
      Router.dispatch(%AddMoney{
        account: account,
        amount: amount,
        concept: concept
      })
  end

  def expendMoneyCommand(account, amount, concept, category) do
    Router.dispatch(%ExpendMoney{
      account: account,
      amount: amount,
      concept: concept,
      category: category
    })
  end
end
