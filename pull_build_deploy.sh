#!/bin/bash

# Usage: ./build_and_push.sh <github_repo_url> <dockerhub_image_name>
# Example: ./build_and_push.sh https://github.com/user/repo.git user/image-name

set -e  # Exit on error

GITHUB_REPO=$1
DOCKER_IMAGE=$2
DOCKER_TAG="latest"
CLONE_DIR="repo"

if [ -z "$GITHUB_REPO" ] || [ -z "$DOCKER_IMAGE" ]; then
  echo "Usage: $0 <github_repo_url> <dockerhub_image_name>"
  exit 1
fi

# Clean previous clone if it exists
rm -rf $CLONE_DIR

# Clone the repo
git clone "$GITHUB_REPO" "$CLONE_DIR"

# Build the Docker image
docker build -t "$DOCKER_IMAGE:$DOCKER_TAG" "$CLONE_DIR"

# Push the Docker image
docker push "$DOCKER_IMAGE:$DOCKER_TAG"

echo "✅ Successfully built and pushed $DOCKER_IMAGE:$DOCKER_TAG"

# Clean previous clone if it exists
rm -rf $CLONE_DIR
