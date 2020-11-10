
# Configure the GitHub Provider
provider "github" {
  token        = var.github_token
  organization = var.github_organization
}

# State saved in s3
provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket         = "fr-personal-account-config"
    key            = "fr_demo_org/fastrobot_demo_github_org/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "fr-personal-account-config-lamont"
    encrypt        = true
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.13.0"
    }
    github = {
      source = "hashicorp/github"
      version = "~> 3.1.0"
    }
  }
}

