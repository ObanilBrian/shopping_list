defmodule SampleWeb.Router do
  use SampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SampleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/", PageController, :create
    get "/samsung", PageController, :samsung
    get "/addphone", PageController, :add_phone
    post "/addphone", PageController, :create_phone
    get "/:id/editphone", PageController, :edit_phone
    put "/:id/editphone", PageController, :update_phone
    delete "/:id/samsung", PageController, :delete_phone
  end

  # Other scopes may use custom stacks.
  # scope "/api", SampleWeb do
  #   pipe_through :api
  # end
end
