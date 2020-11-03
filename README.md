### CircleCI using Terraform to manage our GitHub Organization 

#### Developing
* Test locally via 
```
docker run -i -t -v `pwd`:/workspace -w /workspace hashicorp/terraform:light init
```