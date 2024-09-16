defmodule Corp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {NodeJS.Supervisor, [path: LiveVue.SSR.NodeJS.server_path(), pool_size: 4]},
      CorpWeb.Telemetry,
      Corp.Repo,
      {DNSCluster, query: Application.get_env(:corp, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Corp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Corp.Finch},
      # Start a worker by calling: Corp.Worker.start_link(arg)
      # {Corp.Worker, arg},
      # Start to serve requests, typically the last entry
      CorpWeb.Endpoint,
      {AshAuthentication.Supervisor, otp_app: :corp}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Corp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CorpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
