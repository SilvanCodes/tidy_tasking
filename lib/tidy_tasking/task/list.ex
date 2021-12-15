defmodule TidyTasking.Task.List do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "lists" do
    field :title, :string
    field :status, Ecto.Enum, values: [:todo, :in_progress, :done]

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:title, :status])
    |> validate_required([:title, :status])
  end
end
