defmodule SpacialProbeWeb.Api.ProbeController do
  use SpacialProbeWeb, :controller

  alias SpacialProbeApi.Services.Probe, as: ProbeService

  def move(conn, params) do
    case ProbeService.move(params) do
      {:ok, probe} -> render(conn, "probe_status.json", probe: probe)
      {:error, message} -> render_error(conn, message)
    end
  end

  defp render_error(conn, message) do
    conn
    |> put_status(:unprocessable_entity)
    |> json(message)
  end
end
