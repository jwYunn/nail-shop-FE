#!/bin/bash

REPOSITORY_NAME="nail-shop-fe"
REGION="ap-northeast-2"
ACCOUNT_ID="441964862929"
IMAGE_TAG="latest"

ECR_REPOSITORY="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPOSITORY_NAME}"

aws ecr get-login-password --region ${REGION} | docker login --username AWS --password-stdin ${ECR_REPOSITORY}

docker build -t ${REPOSITORY_NAME} .

docker tag ${REPOSITORY_NAME}:${IMAGE_TAG} ${ECR_REPOSITORY}:${IMAGE_TAG}

docker push ${ECR_REPOSITORY}:${IMAGE_TAG}

echo "Docker image pushed on ECR"
