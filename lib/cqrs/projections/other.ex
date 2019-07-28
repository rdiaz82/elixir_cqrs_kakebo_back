defmodule Cqrs.Projections.Other do
  use Ecto.Schema
@primary_key {:id, :binary_id, autogenerate: true}

  schema "other_movement" do
    field :account, :integer
    field :amount, :float
    field :concept, :string
    field :inserted_at, :utc_datetime
    field :updated_at, :utc_datetime
  end

end
