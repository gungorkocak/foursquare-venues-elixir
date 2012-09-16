defmodule FoursquareVenues.Mixfile do
  use Mix.Project

  def project do
    [ app: :foursquare_venues,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [applications: [:ibrowse]]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      { :httpotion, "0.1.0",  git: "https://github.com/myfreeweb/httpotion.git"   },
      { :ibrowse,   "4.0.1",  git: "https://github.com/cmullaparthi/ibrowse.git"  },
      { :jsx,       "1.3.3",  git: "https://github.com/talentdeficit/jsx.git"     }
    ]
  end
end
