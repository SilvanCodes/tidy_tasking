defmodule TidyTaskingWeb.Assings do
  defmacro __using__(opts) do
    for {name, value} <- opts do
      case name do
        :assigns ->
          Module.put_attribute(__CALLER__.module, name, value)

        :events ->
          for event <- value do
            Module.put_attribute(__CALLER__.module, event, Atom.to_string(event))
          end

          Module.put_attribute(
            __CALLER__.module,
            name,
            Map.new(value, fn event -> {event, Atom.to_string(event)} end)
          )
      end
    end

    # do something with opts
    quote do
      defp checked_assign(socket, key, value) when is_atom(key) do
        @assigns |> IO.inspect()

        if key in @assigns do
          assign(socket, key, value)
        else
          raise KeyError, message: "Key #{inspect(key)} is not in #{inspect(@assigns)}"
        end
      end
    end
  end
end
