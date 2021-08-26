#!/usr/bin/env bash

set -e

export COLOR='\033[0;32m'
export NC='\033[0m'
export ERR='\033[0;31m'

export AWS_PROFILE_PARAM=''

export AWS_ENV_SECRET_NAME='encore/web/staging'
export TAG_NAME=${TAG:-"latest-$(git rev-parse HEAD)"}
export AWS_PRIVATE_KEY_PATH='permission.pem'
export AWS_ECR_REPO_URL="286159759869.dkr.ecr.us-east-1.amazonaws.com/encore-test:${TAG_NAME}"
export AWS_ECR_REPO_URI="286159759869.dkr.ecr.us-east-1.amazonaws.com/encore-test"
export AWS_INSTANCE_URL='ubuntu@107.20.144.22'
export AWS_INSTANCE_REGION='us-east-1'