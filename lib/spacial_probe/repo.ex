defmodule SpacialProbe.Repo do
  use Ecto.Repo,
    otp_app: :spacial_probe,
    adapter: Ecto.Adapters.Postgres
end
