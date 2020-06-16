defmodule RcdWeb.Router do
  use RcdWeb, :router

  import RcdWeb.UserAuth
  import Phoenix.LiveDashboard.Router

  use Plug.ErrorHandler
  use Sentry.Plug

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :portal_layout do
    plug :put_layout, {RcdWeb.LayoutView, "portal.html"}
  end

  scope "/", RcdWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/reading", ReadingListController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RcdWeb do
  #   pipe_through :api
  # end

  ## Authentication routes

  scope "/", RcdWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/login", UserSessionController, :new
    post "/users/login", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", RcdWeb do
    pipe_through [:browser, :require_authenticated_user, :portal_layout]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings/update_password", UserSettingsController, :update_password
    put "/users/settings/update_email", UserSettingsController, :update_email
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email

    get "/dashboard", PageController, :dashboard
    get "/todo", PageController, :todo

    get "/library/authors", AuthorController, :index
    get "/library/authors/new", AuthorController, :new
    post "/library/authors", AuthorController, :create
    get "/library/authors/:slug", AuthorController, :show
    get "/library/authors/:slug/edit", AuthorController, :edit
    patch "/library/authors/:slug", AuthorController, :update
    put "/library/authors/:slug", AuthorController, :update
    delete "/library/authors/:slug", AuthorController, :delete

    get "/library", BookController, :index
    get "/library/books", BookController, :index
    get "/library/books/new", BookController, :new
    post "/library/books", BookController, :create
    get "/library/books/:slug", BookController, :show
    get "/library/books/:slug/edit", BookController, :edit
    patch "/library/books/:slug", BookController, :update
    put "/library/books/:slug", BookController, :update
    delete "/library/books/:slug", BookController, :delete
    post "/library/books/:slug/completions", BookCompletionController, :create
    delete "/library/books/:slug/completions/:id", BookCompletionController, :delete
  end

  scope "/" do
    pipe_through [:browser, :require_authenticated_user]
    live_dashboard "/telemetry", metrics: RcdWeb.Telemetry
  end

  scope "/", RcdWeb do
    pipe_through [:browser]

    delete "/users/logout", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :confirm
  end
end
