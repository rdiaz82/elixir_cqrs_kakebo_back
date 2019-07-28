
defmodule Cqrs.Queries.GetMovements do
  import Ecto.Query

  alias Cqrs.Projections.Account

  def new(account) do
    from u in Account,
    where: u.account == ^account
  end
end
