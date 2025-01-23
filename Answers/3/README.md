# Continuous Deployment (CD)

First i assigned MFA for my user.
Then i created access id and token for my user and added to github actions as env var and secret so my terraform CLI can access the aws resources.
Added CD job that checking format of tf files, checking validity of the files and finally applying our resources to the cloud.