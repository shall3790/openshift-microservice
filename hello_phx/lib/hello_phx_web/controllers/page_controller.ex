defmodule HelloPhxWeb.PageController do
  use HelloPhxWeb, :controller
  # test
  def index(conn, _params) do
    render conn, "index.html"
  end
end
