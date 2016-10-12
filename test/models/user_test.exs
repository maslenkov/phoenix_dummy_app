defmodule HelloPhoenix.UserTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.{User, Repo}

  @valid_attrs %{name: "some content", tags: [%{key: "some content", values: ["a", "b"]}]}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  describe "embeds_many" do
    test "doc way" do
      {:ok, user} = %User{}
        |> User.changeset(%{name: "Eugene", tags: [%{key: "a", values: ["1", "2"]}, %{key: "b", values: ["3"]}]})
        |> Repo.insert

      assert Enum.count(user.tags) == 2

      {status, user} = user
        |> User.changeset(%{tags: []})
        |> Repo.update

      if status == :error do
        IO.inspect user.errors
      end
      assert user.tags == []
    end

    test "platformatec way" do
      {:ok, user} = %User{}
        |> User.changeset(%{name: "Eugene", tags: [%{key: "a", values: ["1", "2"]}, %{key: "b", values: ["3"]}]})
        |> Repo.insert

      assert Enum.count(user.tags) == 2

      map_with_tag_marked_to_delete = user.tags
        |> Enum.map(fn (tag) ->
          if tag.key == "a" do
            %{tag | delete: true}
          else
            tag
          end |> Map.from_struct
        end)
      {status, user} = user
        |> User.changeset(%{tags: map_with_tag_marked_to_delete})
        |> Repo.update

      if status == :error do
        IO.inspect user.errors
      end
      assert Enum.count(user.tags) == 1
    end
  end
end
