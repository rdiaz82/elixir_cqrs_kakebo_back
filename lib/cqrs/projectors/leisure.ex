defmodule  Cqrs.Projectors.Leisure do
  use Commanded.Projections.Ecto,
    name: "Projectors.Leisure",
    consistency: :strong

  alias Cqrs.Events.MoneyExpent
  alias Cqrs.Projections.Leisure

  project(%MoneyExpent{category: "leisure"} = expent, fn multi -> insertMovement(multi, expent) end)

  defp insertMovement(multi, movement) do
    date = DateTime.truncate(DateTime.utc_now, :second)
    Ecto.Multi.insert(multi, :survival, %Leisure{
      account: movement.account,
      amount: movement.amount,
      concept: movement.concept,
      inserted_at: date,
      updated_at: date
    })
  end
end
