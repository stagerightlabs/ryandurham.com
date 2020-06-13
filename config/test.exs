use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :library, Library.Repo,
  username: "postgres",
  password: "postgres",
  database: "library_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rcd_web, RcdWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Email configuration
config :admin, Admin.Email.Mailer, adapter: Bamboo.TestAdapter

# Finally import the config/prod.secret.exs which loads secrets
# and configuration from environment variables.
import_config "test.secret.exs"
