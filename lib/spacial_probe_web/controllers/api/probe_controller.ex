defmodule SpacialProbeWeb.Api.ProbeController do
  use SpacialProbeWeb, :controller

  alias SpacialProbe.Probe

  def move(conn, params) do
    render(conn, "probe_status.json", probe: %Probe{})
  end
end
