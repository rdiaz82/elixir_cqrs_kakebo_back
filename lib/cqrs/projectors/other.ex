defmodule  Cqrs.Projectors.Survival do
  use Commanded.Projections.Ecto,
    name: "Projectors.Survival",
    consistency: :strong

  alias Cqrs.Events.MoneyExpent
  alias Cqrs.Projections.Survival

  project(%MoneyExpent{category: "survival"} = expent, fn multi -> insertMovement(multi, expent) end)

  defp insertMovement(multi, movement) do
    date = DateTime.truncate(DateTime.utc_now, :second)
    Ecto.Multi.insert(multi, :survival, %Survival{
      account: movement.account,
      amount: movement.amount,
      concept: movement.concept,
      inserted_at: date,
      updated_at: date
    })
  end
end
