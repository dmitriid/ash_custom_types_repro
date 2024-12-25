defmodule Events do
  use Ash.Domain

  resources do
    resource(Events.Event)
  end
end
