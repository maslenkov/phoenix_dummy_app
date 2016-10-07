defmodule HelloPhoenix.Tags do
  use HelloPhoenix.Web, :model

  embedded_schema do
    field :values, {:array, :string}
  end

  # def changeset(struct, params \\ %{}) do
  #   struct
  #   |> cast(params, [:name])
  #   |> cast_embed(:tags)
  #   |> validate_required([:name])
  # end
end
