defmodule PlugExample.Router do
  #
  # Plug ships with a router that allows developers to quickly match on
  # incoming requests and perform some action:
  # https://hexdocs.pm/plug/readme.html#the-plug-router
  #
  use Plug.Router
  #
  # This module defines a Plug.Conn struct and the main functions for working with Plug connections.
  # https://hexdocs.pm/plug/Plug.Conn.html
  #
  import Plug.Conn
  # Logs request to STDOUT
  plug Plug.Logger
  # Matches request to a route
  plug :match
  # Dispatches request to a route
  plug :dispatch

  #
  # Start a GenServer, i.e., a server instance:
  #
  # http://elixir-lang.org/getting-started/mix-otp/genserver.html
  # https://blog.drewolson.org/understanding-gen-server/
  #
  def start_link do
    # Cowboy adapter:
    # https://hexdocs.pm/plug/Plug.Adapters.Cowboy.html
    #
    # Cowboy is a small, fast and modular HTTP server written in Erlang:
    # https://github.com/ninenines/cowboy
    #
    {:ok, _} = Plug.Adapters.Cowboy.http PlugExample.Router, []
  end

  #
  # HTTP GET /
  #
  # Use conn.private to access route options:
  #   conn.private[:protected]
  #
  get "/", private: %{protected: false} do
    conn |> send_resp(200, "Hello world")
  end

  get "/favicon.ico" do
    conn |> send_resp(200, "LOL")
  end

  # Forward request to another router.
  #
  # Note that the plugs defined here are executed before the request is
  # forwarded. This means, for example, that the Logger and CSRFProtection
  # plugs must only be defined in lib/router.ex, otherwise the plugs are
  # executed twice.
  forward "/about", to: PlugExample.About

  #
  # A catch-all route
  #
  match _ do
    conn |> send_resp(404, "Not found")
  end
end
