defmodule HelloPhoenix.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :tags, {:array, :map}

      timestamps()
    end

  end
end
