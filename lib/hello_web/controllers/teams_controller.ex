defmodule HelloWeb.TeamsController do
  use HelloWeb, :controller
  alias Hello.Team
  alias Hello.Repo

  def index(conn, _params) do
    teams = Repo.all(Team)
    render conn, "index.html", teams: teams
  end

  def show(conn, %{"id" => id}) do
    team = Repo.get(Team, id) |> Repo.preload(:users)
    users_name = Enum.map(team.users, fn x -> x end)
    render conn, "show.html", team_members: users_name
  end
end
