defmodule TidyTasking.Task do
  import Ecto.Query, only: [from: 2]

  alias TidyTasking.Repo
  alias TidyTasking.Task.Todo
  alias TidyTasking.Task.List
  alias TidyTasking.Task.TodoList

  def create_todo(%{} = todo) do
    %Todo{}
    |> Todo.changeset(todo)
    |> Repo.insert()
  end

  def all_todos() do
    from(todo in Todo, select: todo) |> Repo.all()
  end

  def create_list(%{} = list) do
    %List{}
    |> List.changeset(list)
    |> Repo.insert()
  end

  def get_list_by_id(id) do
    from(list in List, where: list.id == ^id, preload: [:todos]) |> Repo.one()
  end

  def all_lists() do
    from(list in List, select: list) |> Repo.all()
  end

  def connect_todo_and_list(%Todo{id: todo_id}, %List{id: list_id}) do
    %TodoList{}
    |> TodoList.changeset(%{todo_id: todo_id, list_id: list_id})
    |> Repo.insert()
  end
end
