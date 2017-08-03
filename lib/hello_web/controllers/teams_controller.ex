defmodule HelloWeb.TeamsController do
  use HelloWeb, :controller
  alias Hello.Team
  alias Hello.Repo

  def index(conn, _params) do
    changeset = Team.changeset(%Team{})

    teams = Repo.all(Team)
    render(conn, "index.html", teams: teams, changeset: changeset)
  end

  def create(conn, %{"team" => team}) do
    Team.changeset(%Team{}, team)
    |> Repo.insert!

    changeset = Team.changeset(%Team{})
    teams = Repo.all(Team)
    render(conn, "index.html", teams: teams, changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    team = Repo.get(Team, id) |> Repo.preload(:users)
    users_name = Enum.map(team.users, fn x -> x end)
    render conn, "show.html", team_members: users_name
  end
end
