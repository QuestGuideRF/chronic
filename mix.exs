defmodule Chronic.Mixfile do
  use Mix.Project

  @source_url "https://github.com/radar/chronic"
  @version "3.2.0"

  def project do
    [
      app: :chronic,
      version: @version,
      elixir: "~> 1.5",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.25.0", only: :dev, runtime: false},
      {:credo, "~> 0.10.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      name: :chronic,
      description: "Синтаксический анализатор даты и времени на естественном языке.",
      files: ["lib", "ЧИТАЙТЕ*", "mix.exs"],
      maintainers: ["Райан Бигг"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      extras: [
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      formatters: ["html"]
    ]
  end
end
