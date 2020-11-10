
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

resource "github_branch_protection" "this_repository_branch_protection" {
  repository     = github_repository.this_repository.name
  branch         = "main"
  enforce_admins = true

  required_status_checks {
    strict   = false
    contexts = ["ci/circleci"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    dismissal_teams       = [github_team.admins.slug]
  }

  restrictions {
    teams = [github_team.admins.slug, github_team.users.slug]
  }
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

resource "github_repository" "project_a" {
  name        = "project_a"
  description = "Example project repo"

  visibility    = "public"
  has_issues    = true
  has_projects  = true
  has_wiki      = false
  has_downloads = false

  default_branch = "main"
}