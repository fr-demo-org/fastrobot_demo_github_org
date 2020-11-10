# create and populate teams for our organization

resource "github_team" "admins" {
  name = "admins"
}

resource "github_team" "users" {
  name = "users"
}
