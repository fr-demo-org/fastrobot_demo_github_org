### CircleCI using Terraform to manage our GitHub Organization 

#### Secrets
To run, we need to set secrets in CircleCI, 
which we will pass in as the following environment variables:
* TF_VAR_github_token (to communicate with the github API)
* AWS_ACCESS_KEY_ID (to access our terraform state file in s3)
* AWS_SECRET_ACCESS_KEY 

#### Other bits
Made a new PAT via https://github.com/settings/tokens/new with
the minimal permissions needed to run this.

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


#### Developing
* Test locally via 
```
docker run -i -t -v `pwd`:/workspace -w /workspace hashicorp/terraform:light init
```