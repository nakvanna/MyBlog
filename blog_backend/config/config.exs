# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blog_backend,
       ecto_repos: [BlogBackend.Repo]

# Configures the endpoint
config :blog_backend,
       BlogBackendWeb.Endpoint,
       url: [
         host: "localhost"
       ],
       secret_key_base: "v6tgsAdjdCm/lX1vNnzLvvExS/bDE0UqttM7Raz9a9IagFMwu+//iNqu1Pt1bp8s",
       render_errors: [
         view: BlogBackendWeb.ErrorView,
         accepts: ~w(html json),
         layout: false
       ],
       pubsub_server: BlogBackend.PubSub,
       live_view: [
         signing_salt: "YzFpvrbK"
       ]

# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#TODO config for Guardian
config :blog_backend,
       BlogBackend.Guardian,
       issuer: "blog_backend",
       secret_key: "j99nsBkhn38Ada8oG8oYedggGgKtUKbQLkLrOQrXWGVdFnJYvtOmQgPxHJx3Bgwd"


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
