defmodule MangleBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    import Supervisor.Spec

    slack_token = Application.get_env(:mangle_bot, MangleBot.Slack)[:token]

    # List all child processes to be supervised
    children = [worker(MangleBot.Slack, [slack_token, :whatever])]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MangleBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
