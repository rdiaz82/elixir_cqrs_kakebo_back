defmodule  Cqrs.Projectors.Other do
  use Commanded.Projections.Ecto,
    name: "Projectors.Other",
    consistency: :strong

  alias Cqrs.Events.MoneyExpent
  alias Cqrs.Projections.Other

  project(%MoneyExpent{category: "other"} = expent, fn multi -> insertMovement(multi, expent) end)

  defp insertMovement(multi, movement) do
    date = DateTime.truncate(DateTime.utc_now, :second)
    Ecto.Multi.insert(multi, :survival, %Other{
      account: movement.account,
      amount: movement.amount,
      concept: movement.concept,
      inserted_at: date,
      updated_at: date
    })
  end
end
