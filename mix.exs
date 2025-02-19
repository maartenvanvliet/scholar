defmodule Scholar.MixProject do
  use Mix.Project

  def project do
    [
      app: :scholar,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:nx, "~> 0.4.2"},
      {:explorer, "~> 0.5.0", only: [:test, :dev]},
      {:nimble_options, "~> 0.5.2"}
    ]
  end

  defp docs do
    [
      main: "Scholar",
      source_url: "https://github.com/elixir-nx/scholar",
      logo: "images/scholar_simplified.png",
      extras: ["notebooks/k_means.livemd", "notebooks/linear_regression.livemd"],
      groups_for_modules: [
        Models: [
          Scholar.Cluster.KMeans,
          Scholar.Decomposition.PCA,
          Scholar.Interpolation.BezierSpline,
          Scholar.Interpolation.CubicSpline,
          Scholar.Interpolation.Linear,
          Scholar.Linear.LinearRegression,
          Scholar.Linear.LogisticRegression,
          Scholar.NaiveBayes.Complement,
          Scholar.NaiveBayes.Gaussian,
          Scholar.NaiveBayes.Multinomial
        ],
        Utilities: [
          Scholar.Covariance,
          Scholar.Impute.SimpleImputer,
          Scholar.Metrics,
          Scholar.Metrics.Clustering,
          Scholar.Metrics.Distance,
          Scholar.Metrics.Similarity,
          Scholar.Preprocessing
        ]
      ],
      before_closing_body_tag: &before_closing_body_tag/1
    ]
  end

  defp before_closing_body_tag(:html) do
    """
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.13.0/dist/katex.min.css" integrity="sha384-t5CR+zwDAROtph0PXGte6ia8heboACF9R5l/DiY+WZ3P2lxNgvJkQk5n7GPvLMYw" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.13.0/dist/katex.min.js" integrity="sha384-FaFLTlohFghEIZkw6VGwmf9ISTubWAVYW8tG8+w2LAIftJEULZABrF9PPFv+tVkH" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.13.0/dist/contrib/auto-render.min.js" integrity="sha384-bHBqxz8fokvgoJ/sc17HODNxa42TlaEhB+w8ZJXTc2nZf1VgEaFZeZvT4Mznfz0v" crossorigin="anonymous"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function() {
        renderMathInElement(document.body, {
          delimiters: [
            { left: "$$", right: "$$", display: true },
            { left: "$", right: "$", display: false },
          ]
        });
      });
    </script>
    """
  end

  defp before_closing_body_tag(_), do: ""
end
