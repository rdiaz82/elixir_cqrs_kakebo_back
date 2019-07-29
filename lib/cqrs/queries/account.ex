
defmodule Cqrs.Queries.Account do
  import Ecto.Query

  alias Cqrs.Projections.Account

  def getMovementsFromAccount(account) do
    from u in Account,
    where: u.account == ^account
  end
end
