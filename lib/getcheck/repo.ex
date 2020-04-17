defmodule Getcheck.Repo do
  use Ecto.Repo,
    otp_app: :getcheck,
    adapter: Ecto.Adapters.Postgres
end
