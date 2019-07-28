defmodule  Cqrs.Projectors.Account do
  use Commanded.Projections.Ecto,
    name: "Projectors.Account",
    consistency: :strong

  alias Cqrs.Events.{MoneyAdded, MoneyExpent}
  alias Cqrs.Projections.Account

  project(%MoneyAdded{} = added, fn multi -> insertMovement(multi, added, "") end)
  project(%MoneyExpent{} = expent, fn multi -> insertMovement(multi, expent, expent.category) end)

  defp insertMovement(multi, movement, category) do
    date = DateTime.truncate(DateTime.utc_now, :second)
    Ecto.Multi.insert(multi, :account, %Account{
      account: movement.account,
      amount: movement.amount,
      concept: movement.concept,
      category: category,
      inserted_at: date,
      updated_at: date
    })
  end
end
