defmodule Hello.Repo.Migrations.CreateUsersTeams do
  use Ecto.Migration

  def change do
    create table(:users_teams, primary_key: false) do
      add :user_id, references(:users)
      add :team_id, references(:teams)
    end

  end
end
