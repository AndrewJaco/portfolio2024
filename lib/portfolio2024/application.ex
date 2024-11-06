defmodule Portfolio2024.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Portfolio2024.Repo,
      # Start the Telemetry supervisor
      Portfolio2024Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Portfolio2024.PubSub},
      # Start the Endpoint (http/https)
      Portfolio2024Web.Endpoint
      # Start a worker by calling: Portfolio2024.Worker.start_link(arg)
      # {Portfolio2024.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Portfolio2024.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Portfolio2024Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
