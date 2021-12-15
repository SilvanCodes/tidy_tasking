defmodule TidyTasking.Repo.Migrations.CreateTodoList do
  use Ecto.Migration

  def change do
    create table(:todo_list, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :todo_id, references(:todos, on_delete: :delete_all, type: :binary_id)
      add :list_id, references(:lists, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:todo_list, [:todo_id])
    create index(:todo_list, [:list_id])

    create(unique_index(:todo_list, [:todo_id, :list_id], name: :todo_id_list_id_unique_index))
  end
end
