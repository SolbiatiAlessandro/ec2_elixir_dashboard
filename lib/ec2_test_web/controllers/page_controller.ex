defmodule Ec2TestWeb.PageController do
  use Ec2TestWeb, :controller
  alias ExAws.EC2
  import SweetXml

  def index(conn, _params) do
    ivs_channels = ivs_channels()
    render(conn, "index.html", %{ivs_channels: ivs_channels})
  end

  def ivs_channels() do
    {:ok, channels} =
      %ExAws.Operation.JSON{
        http_method: :post,
        headers: [
          {"content-type", "application/x-amz-json-1.1"}
        ],
        path: "/ListChannels",
        service: :ivs
      }
      |> ExAws.request()

    channels["channels"]
  end
end
