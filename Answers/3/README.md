# Continuous Deployment (CD)

First i assigned MFA for my user.

Then i created access id and token for my user and added to github actions as env var and secret so my terraform CLI can access the aws resources.
Added CD job that checking format of tf files, checking validity of the files and finally applying our resources to the cloud.
Only one concurrent workflow for making sure terraform state management does not collide.
For the state management i decided using the github artifacts and not external backend system for example s3 or hashicorp terraform repository.
Every successful run i uploaded the terraform.tfstate file as artifact and also updated a repository variable of the last successful workflow run id so I can keep track of the artifact.
Then every run also downloads the last terraform.tfstate file before applying the IaC in order to know what changes supposed to be done. Added some more files to .dockerignore and .gitignore.

In Targil 2 i used latest tag and i changed to using versioning system because i found out it is kinda hard for maintaining versions in aws ecs fargate. The versioning is by another repository variable that is increased by 1 patch every successful commit. for minor and major increasement a manual variable modifying is required.

I used terraform as my IaC provider. I am using different best practices of file structures and modules.

For the AWS resources. I created those resources.
1. VPC, Subnet, Internet Gateway, Route table
2. Security Group, Ingress Policy, Egress Policy
3. S3 Bucket
4. IAM Role, Role Policy
5. ECS Cluster, Task Definition, Service

The vpc has internet gateway, a route table that connects every non local traffic to the ig and a public subnet, no private subnet.
The security group is allowing ingress traffic to the related port, by default 3000, also to be able to pull dockerhub images there is an egress rule allowing 443 port traffic for every ip, 0.0.0.0/0 cidr, because dockerhub has no static ip and sg doesnt support dns policies.
regular s3 bucket.
IAM role that can be assumed only for ecs-tasks.amazonaws.com resources. the iam role give permissions to the related bucket. I will mention that after some trying and assesing the needed permissions are ListBucket for BucketARN and GetObject for BucketARN/*, which is weird because i thought it will need only GetObject action permissions because we do specify a specific file name in the request but I guess that is how the javascript @aws-sdk/client-s3 S3 headObject function works, might not be ideal for permissions in our use case. 
ECS cluster. Task Definition with one container and auto assignment of public ip with configurable cpu, memory, image, environment variables. An ECS Service that executes the task definition.

Limitations:
There is no elastic ip so the ip might change every successful commit, i thought i created alot of resources already so i didnt do it for now. It is verbosing.