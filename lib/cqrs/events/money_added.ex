defmodule Cqrs.Events.MoneyAdded do
  @derive Jason.Encoder
  defstruct [
    :account,
    :amount,
    :concept
  ]
end
