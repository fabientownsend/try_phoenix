defmodule HelloWeb.PageControllerTest do
  use HelloWeb.ConnCase
  alias Hello.Repo
  alias Hello.User

  test "GET /", %{conn: conn} do
    people = [
      %User{email: "Ryan@email.com", name: "Bigg"},
      %User{email: "John@email.com", name: "Smith"},
      %User{email: "Jane@email.com", name: "Smith"},
    ]

    Enum.each(people, fn (person) -> Repo.insert!(person) end)

    assert Repo.all(User) == %{}
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
