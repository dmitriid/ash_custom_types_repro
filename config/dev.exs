import Config

config :ash_custom_types_repro, AshCustomTypesRepro.Repo,
  username: "events",
  password: "events",
  hostname: "localhost",
  database: "events",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
