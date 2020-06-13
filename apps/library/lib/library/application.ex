defmodule Library.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Library.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Library.PubSub}
      # Start a worker by calling: Library.Worker.start_link(arg)
      # {Library.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Library.Supervisor)
  end
end
