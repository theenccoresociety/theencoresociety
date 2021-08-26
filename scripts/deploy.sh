#!/usr/bin/env bash

set -e

source ./scripts/set_environment.sh

echo -e "${COLOR}::::login aws::::${NC}"

aws ecr get-login-password --region ${AWS_INSTANCE_REGION} | docker login --username AWS --password-stdin ${AWS_ECR_REPO_URL}

docker build -t ${AWS_ECR_REPO_URL} .

echo -e "${COLOR}::::pushing to aws repo::::${NC}"
docker push ${AWS_ECR_REPO_URL}

echo -e "${COLOR}::::ssh and deploy::::${NC}"

ssh -o StrictHostKeyChecking=no -i "${AWS_PRIVATE_KEY_PATH}" ${AWS_INSTANCE_URL} "IMAGE_URL=${AWS_ECR_REPO_URL} ./deploy.sh"

echo "SSH DONE"