defmodule Ec2TestWeb.PageController do
  use Ec2TestWeb, :controller
  alias ExAws.EC2
  import SweetXml

  def index(conn, _params) do
    {:ok, ret} = ExAws.EC2.describe_instances() |> ExAws.request()
    instances = parse_server_list_data(ret.body)
    render(conn, "index.html", %{instances: instances, body: to_string(ret.body)})
  end

  defp parse_server_list_data(data) do
    raw_data =
      data
      |> xpath(
        ~x"//reservationSet/item"l,
        instanceId: ~x"./instancesSet/item/instanceId/text()",
        launchTime: ~x"./instancesSet/item/launchTime/text()"
      )

    Enum.map(raw_data, fn server ->
      %{
        server: to_string(server[:instanceId]),
        create_time: to_string(server[:launchTime])
      }
    end)
  end
end
