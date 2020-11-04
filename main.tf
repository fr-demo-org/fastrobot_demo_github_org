
resource "github_repository" "this_repository" {
  name        = "fastrobot_demo_github_org"
  description = "CircleCI driven Terraform managing this GitHub Organization"

  visibility   = "public"
  has_issues   = true
  has_projects = true
  has_wiki     = false
  has_downloads = false

  default_branch = "main"
}
