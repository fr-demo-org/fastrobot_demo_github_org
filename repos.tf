
resource "github_repository" "this_repository" {
  name        = "fastrobot_demo_github_org"
  description = "CircleCI driven Terraform managing this GitHub Organization"

  visibility    = "public"
  has_issues    = true
  has_projects  = true
  has_wiki      = false
  has_downloads = false

  default_branch = "main"
}

resource "github_repository_collaborator" "main_collab" {
  repository = github_repository.this_repository.name
  for_each   = toset(var.gh_admins)
  username   = each.key
  permission = "admin"
}

resource "github_branch_protection" "this_repository_branch_protection" {
  repository_id  = github_repository.this_repository.node_id
  pattern        = "main"
  enforce_admins = true

  //  required_status_checks {
  //    strict   = false
  //    contexts = ["ci/circleci"]
  //  }

  //  required_pull_request_reviews {
  //    dismiss_stale_reviews = true
  //    dismissal_restrictions = [
  //      github_team.admins.node_id
  //    ]
  //  }

  push_restrictions = [
    github_team.admins.node_id, github_team.users.node_id
  ]
}

resource "github_repository" "packer_repository" {
  name        = "fastrobot_demo_image_manager"
  description = "CircleCI driven packer managing our images"

  visibility    = "public"
  has_issues    = true
  has_projects  = true
  has_wiki      = false
  has_downloads = false

  default_branch = "main"
}

resource "github_repository" "chef_repository" {
  name        = "fastrobot_demo_chef-repo"
  description = "CircleCI driven chef managing our hosts"

  visibility    = "private"
  has_issues    = true
  has_projects  = true
  has_wiki      = false
  has_downloads = false

  default_branch = "main"
}

resource "github_repository" "repos" {
  for_each = toset(var.gh_projects)
  name     = each.key

  visibility    = "public"
  has_issues    = true
  has_projects  = true
  has_wiki      = false
  has_downloads = false

  default_branch = "main"
}