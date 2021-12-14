defmodule TidyTasking.Repo do
  use Ecto.Repo,
    otp_app: :tidy_tasking,
    adapter: Ecto.Adapters.Postgres
end
