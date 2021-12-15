defmodule TidyTasking.TaskTest do
  use TidyTasking.DataCase

  alias TidyTasking.Task

  describe "todos" do
    @valid_attrs %{description: "Be awesome", status: :done}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Task.create_todo()

      todo
    end

    test "all_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Task.all_todos() == [todo]
    end
  end

  describe "lists" do
    @valid_attrs %{title: "Most important", status: :todo}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Task.create_list()

      list
    end

    test "all_lists/0 returns all lists" do
      list = list_fixture()
      assert Task.all_lists() == [list]
    end

    test "can put todo in list" do
      list = list_fixture()
      todo = todo_fixture()

      assert {:ok, _} = Task.connect_todo_and_list(todo, list)

      list = Task.get_list_by_id(list.id)

      assert [todo] = list.todos
    end
  end
end
