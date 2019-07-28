defmodule Cqrs.Repo.Migrations.CreateProjectionVersions do
  use Ecto.Migration

  def change do
    create table(:projection_versions, primary_key: false) do
      add :projection_name, :text, primary_key: true
      add :last_seen_event_number, :bigint
      timestamps()
    end

    create table(:account_movement, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :account, :integer
      add :amount, :float
      add :concept, :string
      add :category, :string
      timestamps()
    end

    create table(:survival_movement, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :account, :integer
      add :amount, :float
      add :concept, :string
      timestamps()
    end

    create table(:leisure_movement, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :account, :integer
      add :amount, :float
      add :concept, :string
      timestamps()
    end

    create table(:other_movement, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :account, :integer
      add :amount, :float
      add :concept, :string
      timestamps()
    end
  end
end
