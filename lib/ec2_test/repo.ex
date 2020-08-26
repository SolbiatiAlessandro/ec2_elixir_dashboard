defmodule Ec2Test.Repo do
  use Ecto.Repo,
    otp_app: :ec2_test,
    adapter: Ecto.Adapters.Postgres
end
