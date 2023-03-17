defmodule SpacialProbeApi.Services.Probe do
  alias SpacialProbeApi.Probe
  
  def move(%{"moviments" => moviments}) do
    moviments
    |> Enum.reduce(%Probe{}, &execute_moviment/2)
    |> validate_moviments
  end

  defp execute_moviment("M", probe) do
    case probe.face do
      "Right" -> %Probe{x: probe.x + 1, y: probe.y, face: probe.face}
      "Left" -> %Probe{x: probe.x - 1, y: probe.y, face: probe.face}
      "Down" -> %Probe{x: probe.x, y: probe.y - 1, face: probe.face}
      "Up" -> %Probe{x: probe.x, y: probe.y + 1, face: probe.face}
    end
  end

  defp execute_moviment("TL", probe) do
    case probe.face do
      "Right" -> %Probe{x: probe.x, y: probe.y, face: "Up"}
      "Up" -> %Probe{x: probe.x, y: probe.y, face: "Left"}
      "Left" -> %Probe{x: probe.x, y: probe.y, face: "Down"}
      "Down" -> %Probe{x: probe.x, y: probe.y, face: "Right"}
    end
  end

  defp execute_moviment("TR", probe) do
    case probe.face do
      "Right" -> %Probe{x: probe.x, y: probe.y, face: "Down"}
      "Down" -> %Probe{x: probe.x, y: probe.y, face: "Left"}
      "Left" -> %Probe{x: probe.x, y: probe.y, face: "Up"}
      "Up" -> %Probe{x: probe.x, y: probe.y, face: "Right"}
    end
  end

  defp execute_moviment(_moviment, _probe), do: :error

  defp validate_moviments(probe) do
    with %Probe{x: x, y: y, face: _face} <- probe,
         true <- x in 0..4,
         true <- y in 0..4
        do
      {:ok, probe}
    else
      _ -> {:error, "Invalid moviment, our probe cannot fly yet"}
    end
  end
end
