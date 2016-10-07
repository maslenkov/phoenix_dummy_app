defmodule HelloPhoenix.User do
  use HelloPhoenix.Web, :model

  schema "users" do
    field :name, :string
    field :tags, HelloPhoenix.Tags

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> cast_embed(:tags)
    |> validate_required([:name])
  end
end
