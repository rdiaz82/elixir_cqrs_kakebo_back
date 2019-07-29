defmodule  Cqrs.Projectors.Account do
  use Commanded.Projections.Ecto,
    name: "Projectors.Account",
    consistency: :strong

  alias Cqrs.Events.{MoneyAdded, MoneyExpent}
  alias Cqrs.Projections.Account

  project(%MoneyAdded{} = added, fn multi -> insertMovement(multi, added.account, added.amount, added.concept, "") end)
  project(%MoneyExpent{} = expent, fn multi -> insertMovement(multi, expent.account, -expent.amount, expent.concept, expent.category) end)

  defp insertMovement(multi, account, amount, concept, category) do
    date = DateTime.truncate(DateTime.utc_now, :second)
    Ecto.Multi.insert(multi, :account, %Account{
      account: account,
      amount: amount,
      concept: concept,
      category: category,
      inserted_at: date,
      updated_at: date
    })
  end
end
