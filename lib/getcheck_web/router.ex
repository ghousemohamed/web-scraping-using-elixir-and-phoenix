defmodule GetcheckWeb.Router do
  use GetcheckWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {GetcheckWeb.LayoutView, :root}
  end

  pipeline :test do
    plug :put_root_layout, {GetcheckWeb.LayoutView, :root}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GetcheckWeb do
    pipe_through :browser

    get "/", PageController, :index

    pipe_through :test
    live "/live", RootLive
    live "/test", UserLive.Index, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", GetcheckWeb do
  #   pipe_through :api
  # end
end
