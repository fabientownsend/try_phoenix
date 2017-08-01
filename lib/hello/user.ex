defmodule Hello.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.User
  alias Hello.Team
  alias Hello.UsersTeams


  schema "users" do
    field :email, :string
    field :name, :string
    many_to_many :teams, Hello.Team, join_through: UsersTeams

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
