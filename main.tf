
resource "github_repository" "this_repository" {
  name        = "fastrobot_demo_github_org"
  description = "CircleCI driven Terraform managing this GitHub Organization"

  private      = false
  has_issues   = true
  has_projects = true
  has_wiki     = false

  default_branch = "main"
}

resource "null_resource" "tf_version" {
  provisioner "local-exec" {
    command = "echo hi"
  }
}