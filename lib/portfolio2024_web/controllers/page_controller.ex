defmodule Portfolio2024Web.PageController do
  use Portfolio2024Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
