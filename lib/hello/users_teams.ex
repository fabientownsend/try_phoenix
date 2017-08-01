defmodule Hello.UsersTeams do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.UsersTeams


  @primary_key false
  schema "users_teams" do
    belongs_to :user, User
    belongs_to :team, Team
  end

  @doc false
  def changeset(%UsersTeams{} = users_teams, attrs) do
    users_teams
    |> cast(attrs, [])
    |> validate_required([])
  end
end
