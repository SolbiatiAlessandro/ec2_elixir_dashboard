use Mix.Config

# Configure your database
config :ec2_test, Ec2Test.Repo,
  username: "postgres",
  password: "postgres",
  database: "ec2_test_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ec2_test, Ec2TestWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
