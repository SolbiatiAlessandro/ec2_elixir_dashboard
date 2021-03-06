# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ec2_test,
  ecto_repos: [Ec2Test.Repo]

# Configures the endpoint
config :ec2_test, Ec2TestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fNaq8Qu+gFDcfNTljURTRlZwvlkE8iSTGmgwe9uoAayTdLQL9vtYbB+skw5E9NAo",
  render_errors: [view: Ec2TestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ec2Test.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
  region: "eu-west-1"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
