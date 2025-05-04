# mooc-shell-build-deploy

## clone → build → push

🧩 Pre-requisites

Run docker login before using the script.

Ensure Docker daemon is running.

Make sure script is executable

`chmod +x pull_build_deploy.sh`

#### Usage: 

`./build_and_push.sh <github_repo_url> <dockerhub_image_name>`

#### Example: 

`./build_and_push.sh https://github.com/user/repo.git user/image-name`
