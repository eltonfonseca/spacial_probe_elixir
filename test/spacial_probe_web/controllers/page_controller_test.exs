defmodule SpacialProbeWeb.PageControllerTest do
  use SpacialProbeWeb.ConnCase

  describe "POST #move_probe" do
    test "returns default position when moviments is empty", %{conn: conn} do
      coords = %{moviments: []}
      expected = %{"x" => 0, "y" => 0, "face" => "Right"}

      response =
        conn
        |> post("/move_probe", coords)
        |> json_response(201)

      assert response = expected
    end
  end
end
