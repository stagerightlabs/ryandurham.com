use Mix.Config

# Configure your database
config :library, Library.Repo,
  username: "postgres",
  password: "postgres",
  database: "library_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure your database
config :rcd, Rcd.Repo,
  username: "postgres",
  password: "postgres",
  database: "rcd_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rcd_web, RcdWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
