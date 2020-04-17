defmodule GetcheckWeb.PageController do
  use GetcheckWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
