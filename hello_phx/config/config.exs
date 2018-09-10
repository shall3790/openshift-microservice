# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :hello_phx, HelloPhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oBRwWfHlcdQ8g5l/ZTdVHSOY7BxYYlZ4/gT9HiHlCZZB4VkarJt6xl5JPA8a29Jg",
  render_errors: [view: HelloPhxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HelloPhx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

#Cluster setup

# config :libcluster,
#   topologies: [
#     k8s_example: [
#       strategy: Cluster.Strategy.Kubernetes,
#       config: [
#         kubernetes_selector: "app=hello-phx",
#         kubernetes_node_basename: "hello_phx"]]]

# config :libcluster,
#   topologies: [
#     gossip_example: [
#       strategy: Cluster.Strategy.Gossip,
#       config: [
#         port: 45892,
#         if_addr: {0,0,0,0},
#         multicast_addr: {230,1,1,251},
#         # a TTL of 1 remains on the local network,
#         # use this to change the number of jumps the
#         # multicast packets will make
#         multicast_ttl: 1]]]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
