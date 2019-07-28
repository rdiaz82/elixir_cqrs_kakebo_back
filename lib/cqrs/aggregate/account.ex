defmodule Cqrs.Aggregate.Account do

  @derive Jason.Encoder
  defstruct [
    :balance,
    :account
  ]

  alias Cqrs.Aggregate.Account
  alias Cqrs.Commands.{AddMoney, ExpendMoney}
  alias Cqrs.Events.{MoneyAdded, MoneyExpent}

  @doc """
  Adding Money to my Account
  """
  def execute(%Account{}, %AddMoney{} = addMoney) do
    %MoneyAdded{
      account: addMoney.account,
      amount: addMoney.amount,
      concept: addMoney.concept
    }
  end

  @doc """
  Spend Money to my Account
  """
  def execute(%Account{}, %ExpendMoney{category: category} = expendMoney) when category in [:survival, :leisure, :other] do
    %MoneyExpent{
      account: expendMoney.account,
      amount: expendMoney.amount,
      concept: expendMoney.concept,
      category: expendMoney.category
    }
  end

  def execute(%Account{}, %ExpendMoney{}) do
    {:error, :category_not_recognized}
  end

  def apply(%Account{balance: nil} = account, %MoneyAdded{} = moneyAdded) do
    %Account{ account |
      account: moneyAdded.account,
      balance: moneyAdded.amount
    }
  end

  def apply(%Account{} = account, %MoneyAdded{} = moneyAdded) do
    %Account{ account |
      account: moneyAdded.account,
      balance: account.balance + moneyAdded.amount
    }
  end

  def apply(%Account{balance: nil} = account, %MoneyExpent{} = moneyExpent) do
    %Account{ account |
      account: moneyExpent.account,
      balance: -moneyExpent.amount
    }
  end
  def apply(%Account{} = account, %MoneyExpent{} = moneyExpent) do
    %Account{ account |
      account: moneyExpent.account,
      balance: account.balance - moneyExpent.amount
    }
  end

end
