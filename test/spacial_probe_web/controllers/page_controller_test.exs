defmodule SpacialProbeWeb.PageControllerTest do
  use SpacialProbeWeb.ConnCase

  describe "POST #move" do
    test "returns default position when moviments is empty", %{conn: conn} do
      coords = %{moviments: []}
      expected = %{"x" => 0, "y" => 0, "face" => "Right"}

      response =
        conn
        |> post("/api/move", coords)
        |> json_response(200)

      assert response == expected
    end
  end
end
