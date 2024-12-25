import Config

config :ash_custom_types_repro, AshCustomTypesRepro.Repo,
  username: "getevents",
  password: "getevents",
  hostname: "172.25.224.1",
  database: "getevents",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
