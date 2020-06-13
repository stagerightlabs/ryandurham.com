# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :library,
  ecto_repos: [Library.Repo]

config :library,
  ecto_repos: [Library.Repo]

config :admin,
  ecto_repos: [Admin.Repo]

config :rcd_web,
  generators: [context_app: :library]

# Configures the endpoint
config :rcd_web, RcdWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BDQ8uBcNj41MXMrbNDhwhEFEfjvgeMrE9gdq0x0vCYEhSIzGOInkXovCJ4xEsxWD",
  render_errors: [view: RcdWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: RcdWeb.PubSub,
  live_view: [
    signing_salt: "K+QRw7YK33vBplcHfq3dF9+PWVpBSDos"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# configure sentry
config :sentry,
  environment_name: Mix.env(),
  included_environments: [:prod],
  enable_source_code_context: true,
  root_source_code_path: File.cwd!()

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure the timezone database
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
