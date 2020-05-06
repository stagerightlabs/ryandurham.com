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

    delete "/users/logout", UserSessionController, :delete
    get "/users/settings", UserSettingsController, :edit
    put "/users/settings/update_password", UserSettingsController, :update_password
    put "/users/settings/update_email", UserSettingsController, :update_email
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email

    get "/dashboard", PageController, :dashboard
    get "/todo", PageController, :todo
  end

  scope "/" do
    pipe_through [:browser, :require_authenticated_user]
    live_dashboard "/telemetry", metrics: RcdWeb.Telemetry
  end

  scope "/", RcdWeb do
    pipe_through [:browser]

    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :confirm
  end
end
