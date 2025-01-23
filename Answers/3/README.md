# Continuous Deployment (CD)

First i assigned MFA for my user.
Then i created access id and token for my user and added to github actions as env var and secret so my terraform CLI can access the aws resources.
Added CD job to automate things.