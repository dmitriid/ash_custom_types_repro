defmodule Events.Event do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    notifiers: [Ash.Notifier.PubSub],
    domain: Events

  postgres do
    table("events")
    repo(AshCustomTypesRepro.Repo)
  end

  code_interface do
    define(:all_events, args: [:status, :is_public])
  end

  actions do
    defaults([:read, :destroy, create: [:status, :is_public]])

    read :all_events do
      argument :status, {:array, Events.Types.Status} do
        allow_nil?(true)
      end

      argument :is_public, {:array, :boolean} do
        allow_nil?(true)
      end

      filter(
        expr(
          if is_nil(^arg(:status)),
            do: not is_nil(status),
            else: status in ^arg(:status)
        )
      )

      filter(
        expr(
          if is_nil(^arg(:is_public)),
            do: not is_nil(is_public),
            else: is_public in ^arg(:is_public)
        )
      )
    end
  end

  attributes do
    uuid_primary_key(:id)

    attribute :is_public, :boolean do
      allow_nil?(false)
      default(false)
      public?(true)
    end

    attribute :status, Events.Types.Status do
      allow_nil?(false)
      default(:processing)
      public?(true)
    end
  end
end
