# Continuous Deployment (CD)

First i assigned MFA for my user.

Then i created access id and token for my user and added to github actions as env var and secret so my terraform CLI can access the aws resources.
Added CD job that checking format of tf files, checking validity of the files and finally applying our resources to the cloud.
Only one concurrent workflow for making sure terraform state management does not collide.
For the state management i decided using the github artifacts and not external backend system for example s3 or hashicorp terraform repository.
Every successful run i uploaded the terraform.tfstate file as artifact and also updated a repository variable of the last successful workflow run id.
Then every run also downloads the last terraform.tfstate file and knows what changes supposed to be done.

Lets remember i have used only latest tag for the container and because of it we have to make sure the image in the deployment is updated correctly when a new image is pushed. For this i added
