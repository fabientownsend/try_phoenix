defmodule HelloWeb.TeamsController do
  use HelloWeb, :controller
  alias Hello.Team
  alias Hello.User
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

  def members(conn, %{"id" => id}) do
    application_users = Repo.all(User)
    team = Repo.get(Team, id) |> Repo.preload(:users)
    team_users = Enum.map(team.users, fn x -> x end)

    render(conn, "show.html", team_members: team_users, application_users: application_users, team_id: id)
  end

  def add_user(conn, %{"id" => team_id, "user_id" => user_id}) do
    user = Repo.get!(User, user_id)
    team = Repo.get!(Team, team_id)

    team |> Team.add(user)

    application_users = Repo.all(User)
    team = Repo.get(Team, team_id) |> Repo.preload(:users)
    team_users = Enum.map(team.users, fn x -> x end)

    render(conn, "show.html", team_members: team_users, application_users: application_users, team_id: team_id)
  end

  def remove_user(conn, _params) do
  end
end
