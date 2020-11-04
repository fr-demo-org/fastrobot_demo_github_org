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
  default     = ["lamont"]
}

variable "gh_users" {
  description = "List with limited users in this GitHub Organization"
  type        = list(string)
  default     = ["jcookfastrobot"]
}