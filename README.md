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

#### References

Some examples taken from:
* https://github.com/cndies/terraform-github-provider-examples
* http://jjasghar.github.io/blog/2019/11/05/github-actions-and-terraform/


#### Developing
* Test locally via 
```
docker run -i -t -v `pwd`:/workspace -w /workspace hashicorp/terraform:light init
```