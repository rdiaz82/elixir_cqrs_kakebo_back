defmodule Cqrs.Projections.Survival do
  use Ecto.Schema
@derive {Jason.Encoder, except: [:__meta__, :updated_at]}
@primary_key {:id, :binary_id, autogenerate: true}

  schema "survival_movement" do
    field :account, :integer
    field :amount, :float
    field :concept, :string
    field :inserted_at, :utc_datetime
    field :updated_at, :utc_datetime
  end

end
