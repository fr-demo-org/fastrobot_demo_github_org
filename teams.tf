# create and populate teams for our organization

resource "github_team" "admins" {
  name = "admins"
}

resource "github_team_membership" "to_admins" {
  team_id  = github_team.admins.id
  for_each = toset(var.gh_admins)
  username = each.key
}

resource "github_team" "users" {
  name = "users"
}

resource "github_team_membership" "to_users" {
  team_id  = github_team.users.id
  for_each = toset(var.gh_users)
  username = each.key
}
