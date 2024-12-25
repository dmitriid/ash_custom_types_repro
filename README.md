# AshCustomTypesRepro

Absolutely minimal repro for issue https://github.com/ash-project/ash/issues/1668.

This emulates enum values by storing integer values in the database, but presenting them as human-readable atoms in code.

| DB | Code |
| --- | --- |
| 0 | `:processing` |
| 1 | `:done` |
| -1 | `:error` |

This is implemented in `Events.Types.Status` and used in `Events.Event`.

A sample function that uses the custom type is `Events.Event.all_events/2`.

```
> iex -S mix

# show all events
> Events.Event.all_events([], [])

# show all events that are processing or done and are public
> Events.Event.all_events([:processing, :done], [true])

# show all events that are error and are not public
> Events.Event.all_events([:error], [false])
```

Assumes Postgres 16.

Does not strictly need any data in the database, but dummy data can be added with

```
> Events.Event |> Ash.Changeset.for_create(:create, %{}) |> Ash.create
> Events.Event |> Ash.Changeset.for_create(:create, %{status: :done}) |> Ash.create
```


