### CircleCI using Terraform to manage our GitHub Organization 

#### TODO
This is a work in progress and is probably at least missing these features:
* replace github PAT with a github app for more restricted permissions
* clean up the README and top level files to make it super clear where new users/teams are managed
* fix the `.circleci/config.yml` to only plan on PR and plan/apply on merge to master
* badges/links to CircleCI
* add https://www.terraform.io/docs/providers/github/r/branch_protection.html to enforce CI and approvers

#### Secrets
To run, we need to set secrets in CircleCI using the `contexts` feature, 
via which we will pass in the following environment variables:
* TF_VAR_github_token (to communicate with the github API)
* AWS_ACCESS_KEY_ID (to access our terraform state file in s3)
* AWS_SECRET_ACCESS_KEY 

#### Other bits
Made a new PAT via https://github.com/settings/tokens/new with
the minimal permissions needed to run this.  Note that a PAT was the wrong
way to go and I should make a new github app with restricted permissions
and use that.

Because I'd made this repo before I wrote terraform resources to manage it, 
I had to import the original repo into the terraform state:
```
terraform import github_repository.this_repository fastrobot_demo_github_org
...
github_repository.this_repository: Importing from ID "fastrobot_demo_github_org"...
github_repository.this_repository: Import prepared!
  Prepared github_repository for import
github_repository.this_repository: Refreshing state... [id=fastrobot_demo_github_org]

Import successful!
``` 

#### References

Some examples taken from:
* https://github.com/cndies/terraform-github-provider-examples
* http://jjasghar.github.io/blog/2019/11/05/github-actions-and-terraform/
* https://www.nicksantamaria.net/post/terraform-circleci-pull-request-workflow/

#### Developing
* Test locally via 
```
docker run -i -t -v `pwd`:/workspace -w /workspace hashicorp/terraform:light init
```