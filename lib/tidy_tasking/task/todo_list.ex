defmodule TidyTasking.Task.TodoList do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "todo_list" do
    field :todo_id, :binary_id
    field :list_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(todo_list, attrs) do
    todo_list
    |> cast(attrs, [:todo_id, :list_id])
    |> validate_required([:todo_id, :list_id])
  end
end
