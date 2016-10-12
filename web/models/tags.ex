defmodule HelloPhoenix.Tags do
  use HelloPhoenix.Web, :model

  @primary_key {:key, :string, autogenerate: false}
  embedded_schema do
    field :values, {:array, :string}
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:key, :values])
  end
end
