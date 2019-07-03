defmodule HelloWeb.Router do
  use HelloWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/hello/:name", HelloController, :world
    get "/", PageController, :index

    live "/welcome", WelcomeLive
    live "/clock", ClockLive
    live "/pictures", PicturesLive
    live "/pictures/:id", PicturesLive
  end


  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
end
