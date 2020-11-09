### CircleCI using Terraform to manage our GitHub Organization 

### Status

We expect the `main` branch of this repo to always be applicable.

`main`: [![CircleCI](https://circleci.com/gh/fr-demo-org/fastrobot_demo_github_org.svg?style=svg)](https://circleci.com/gh/fr-demo-org/fastrobot_demo_github_org)

#### TODO
This is a work in progress and is probably at least missing these features:
* DONE ~~replace github PAT with a github app for more restricted permissions~~
* clean up the README and top level files to make it super clear where new users/teams are managed
* DONE ~~fix the `.circleci/config.yml` to only plan on PR and plan/apply on merge to master~~ plan is 
uploaded using github-commenter if the commit is part of a PR.  
* DONE ~~badges/links to CircleCI~~
* add https://www.terraform.io/docs/providers/github/r/branch_protection.html to enforce CI and approvers
* tests: add an inspec or similar assertion that we haven't locked everybody out of admin, repos are still private, etc
* add a slack notification step that happens on "waiting for approval" and "post-deploy"

#### Secrets
To run, we need to set secrets in CircleCI using the `contexts` feature, 
via which we will pass in the following environment variables:
* TF_VAR_github_token (to communicate with the github API)
* AWS_ACCESS_KEY_ID (to access our terraform state file in s3)
* AWS_SECRET_ACCESS_KEY 

You could also use https://github.com/mrolla/terraform-provider-circleci to populate CircleCI contexts
from some external source.

#### Other bits
Made a machine-user in github, an empty account tied to just this org. Then made a new PAT via https://github.com/settings/tokens/new with
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
* https://www.gruntwork.io/guides/automations/how-to-configure-a-production-grade-ci-cd-setup-for-apps-and-infrastructure-code

#### Developing
* Test locally via 
```
docker run -i -t -v `pwd`:/workspace -w /workspace hashicorp/terraform:light init
```
after setting the appropriate environment variables and passing them in. 