defmodule Hello.Team do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Hello.Repo
  alias Hello.Team
  alias Hello.User
  alias Hello.UsersTeams


  schema "teams" do
    field :name, :string
    many_to_many :users, Hello.User, join_through: UsersTeams

    timestamps()
  end

# team |> Team.add(user)
  def add(team, user) do
    Repo.insert(%UsersTeams{user_id: user.id, team_id: team.id})
  end

# team |> Team.remove(user)
  def remove(team, user) do
    q = from ut in UsersTeams, where: ut.user_id == ^user.id and ut.team_id == ^team.id
    Repo.delete_all(q)
  end

  @doc false
  def changeset(%Team{} = team, attrs) do
    team
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
