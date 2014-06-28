defmodule TheAlchemist.Mixfile do
  use Mix.Project

  def project do
    [app: :thealchemist,
     description: "Elixir implementation of MessagePack",
     version: "0.0.1",
     elixir: "~> 0.14.1",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end

  # Dependencies can be hex.pm packages:
  #
  # {:msgpack, ".*"}
  #
  # Or git/path repositories:
  #
  # {:msgpack, git: "git://github.com/msgpack/msgpack-erlang.git", branch: "master"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{ :msgpack, github: "msgpack/msgpack-erlang" }]
  end
end
