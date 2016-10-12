defmodule HelloPhoenix.Tags do
  use HelloPhoenix.Web, :model

  @primary_key {:key, :string, autogenerate: false}
  embedded_schema do
    field :values, {:array, :string}
    field :delete, :boolean, virtual: true
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:key, :values])
    |> validate_required([:key])
    |> mark_for_deletion()
  end

  defp mark_for_deletion(changeset) do
    if get_change(changeset, :delete) do
      %{changeset | action: :delete}
    else
      changeset
    end
  end
end
