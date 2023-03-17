defmodule SpacialProbeWeb.ProbeControllerTest do
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

    test "returns success postition when moviments is valid", %{conn: conn} do
      coords = %{moviments: ["M", "M", "TL", "M", "TR", "M", "M", "TR"]}
      expected = %{"x" => 4, "y" => 1, "face" => "Down"}

      response =
        conn
        |> post("/api/move", coords)
        |> json_response(200)

      assert response == expected
    end

    test "returns invalid moviments when moviments break border on X axis", %{conn: conn} do
      coords = %{moviments: ["M", "M", "M", "M", "M", "M"]}
      expected = "Invalid moviment, our probe cannot fly yet"

      response =
        conn
        |> post("/api/move", coords)
        |> json_response(422)

      assert response == expected
    end

    test "returns invalid moviments when moviments break border on Y axis", %{conn: conn} do
      coords = %{moviments: ["TL", "M", "M", "M", "M", "M"]}
      expected = "Invalid moviment, our probe cannot fly yet"

      response =
        conn
        |> post("/api/move", coords)
        |> json_response(422)

      assert response == expected
    end

    test "return invalid moviments with invalid params", %{conn: conn} do
      coords = %{moviments: ["any moviments"]}
      expected = "Invalid moviment, our probe cannot fly yet"

      response =
        conn
        |> post("/api/move", coords)
        |> json_response(422)

      assert response == expected
    end
  end
end
