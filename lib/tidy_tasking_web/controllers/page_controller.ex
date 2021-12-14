defmodule TidyTaskingWeb.PageController do
  use TidyTaskingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
