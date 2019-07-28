defmodule Cqrs.Commands.ExpendMoney do
  defstruct [:account, :amount, :concept, :category]
end
