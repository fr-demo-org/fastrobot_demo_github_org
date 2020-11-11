variable "github_organization" {
  type    = string
  default = "fr-demo-org"
}

variable "github_token" {
  type = string
}

variable "gh_admins" {
  description = "List with admin users in this GitHub Organization"
  type        = list(string)
  default     = ["fr-demo-ci", "lamont", "jcookfastrobot"]
}

variable "gh_users" {
  description = "List with limited users in this GitHub Organization"
  type        = list(string)
  default     = ["jcookfastrobot", "lamont"]
}

variable "gh_projects" {
  description = "List of repos to manage"
  type        = list(string)
  default     = ["project_b", "project_c", "project_d", "new_demo_repo"]
}
