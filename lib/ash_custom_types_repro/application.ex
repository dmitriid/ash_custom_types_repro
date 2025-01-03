defmodule AshCustomTypesRepro.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [AshCustomTypesRepro.Repo]

    opts = [strategy: :one_for_one, name: AshCustomTypesRepro.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
