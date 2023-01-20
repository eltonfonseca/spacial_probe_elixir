defmodule SpacialProbeWeb.Api.ProbeView do
  use SpacialProbeWeb, :view

  def render("probe_status.json", %{probe: probe}) do
    %{
      x: probe.x,
      y: probe.y,
      face: probe.face
    }
  end
end
