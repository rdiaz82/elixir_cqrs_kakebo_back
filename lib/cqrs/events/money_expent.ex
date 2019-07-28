
defmodule Cqrs.Events.MoneyExpent do
  @derive Jason.Encoder
  defstruct [
    :account,
    :amount,
    :concept,
    :category
  ]
end
