defmodule DbProjWeb.PageController do
  use DbProjWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
