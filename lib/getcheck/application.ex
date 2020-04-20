defmodule Getcheck.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    import Supervisor.Spec
    children = [
      # Start the Ecto repository
      Getcheck.Repo,
      # Start the endpoint when the application starts
      GetcheckWeb.Endpoint,
      # Starts a worker by calling: Getcheck.Worker.start_link(arg)
      # {Getcheck.Worker, arg},
      worker(Getcheck.Cron, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Getcheck.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GetcheckWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
