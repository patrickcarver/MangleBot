defmodule MangleBot.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mangle_bot,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :slack],
      mod: {MangleBot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:slack, "~> 0.12.0"},
      {:better_mangler, path: "../better_mangler"}
    ]
  end
end
