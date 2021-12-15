defmodule TidyTaskingWeb.TaskLive do
  use TidyTaskingWeb, :live_view

  use TidyTaskingWeb.Assings, assigns: [:list, :events], events: [:validate, :submit]

  import Ecto.Changeset, [:change, 2]

  alias TidyTasking.Task.List
  alias TidyTasking.Task.Todo

  def render(assigns) do
    ~H"""
    <.form let={f} for={@list} phx-change={@events[:validate]} phx-submit={@events[:submit]}>
      <label>
      Title: <%= text_input f, :title %>
      </label>

      <label>
      Status: <%= text_input f, :status %>
        <label>
        Todo: <%= radio_button f, :status, "todo" %>
        </label>
        <label>
        In progress: <%= radio_button f, :status, "in_progress" %>
        </label>
        <label>
        Done: <%= radio_button f, :status, "done" %>
        </label>
      </label>

      <%= inputs_for f, :todos, fn todo -> %>
      <label>
        Todo: <%= text_input todo, :status %>
        </label>
      <% end %>
    </.form>
    """
  end

  def mount(_params, _session, socket) do
    list = change(%List{todos: [%Todo{}], status: :todo})

    socket
    |> checked_assign(:list, list)
    |> checked_assign(:events, @events)
    |> ok()
  end

  def handle_event(@validate, %{"list" => params}, socket) do
    list =
      %List{}
      |> List.changeset(params)
      |> Map.put(:action, :insert)

    socket
    |> checked_assign(:list, list)
    |> noreply()
  end

  defp ok(socket), do: {:ok, socket}

  defp noreply(socket), do: {:noreply, socket}
end
