defmodule TidyTasking.Task.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "todos" do
    field :description, :string
    field :status, Ecto.Enum, values: [:todo, :in_progress, :done]

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:description, :status])
    |> validate_required([:description, :status])
  end
end
