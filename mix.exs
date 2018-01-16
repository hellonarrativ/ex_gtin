defmodule ExGtin.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_gtin,
      version: "0.2.6",
      elixir: "~> 1.4",
      description: description(),
      aliases: aliases(),
      package: package(),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      source_url: "https://github.com/kickinespresso/ex_gtin",
      test_coverage: [tool: ExCoveralls],
      coverallspreferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:credo, "~> 0.9.0-rc1", only: [:dev, :test]},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:excoveralls, "~> 0.8", only: :test}
    ]
  end

  defp package do
    [
      name: "ex_gtin",
      maintainers: ["KickinEspresso"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kickinespresso/ex_gtin"}
    ]
  end

  defp aliases do
    [c: "compile",
      "pull_request_checkout.task": [
        "test",
        "credo --strict",
        "coveralls"
      ]
    ]
  end

  defp description do
     """
       Elixir GTIN Validation Library.
     """
  end
end
