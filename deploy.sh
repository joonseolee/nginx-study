#!/bin/bash
txtrst='\033[1;37m' # White
txtred='\033[1;31m' # Red
txtylw='\033[1;33m' # Yellow
txtpur='\033[1;35m' # Purple
txtgrn='\033[1;32m' # Green
txtgra='\033[1;30m' # Gray

IMAGE_NAME=$1
TARGET_REPOSITORY_NAME=$2
TAG=$3

echo -e "${txtylw}=======================================${txtrst}\n"
echo -e "${txtgrn}  << 유효성 체크중... 🧐 >>${txtrst}"

if [ -z "$IMAGE_NAME" ]; then
    echo -e "${txtred}IMAGE_NAME is required"
    echo -e "${txtylw}=======================================${txtrst}"
    exit -1
fi

if [ -z "$TARGET_REPOSITORY_NAME" ]; then
    echo -e "${txtred}TARGET_REPOSITORY_NAME is required"
    echo -e "${txtylw}=======================================${txtrst}"
    exit -1
fi

if [ -z "$TAG" ]; then
    echo -e "${txtred}TAG is required"
    echo -e "${txtylw}=======================================${txtrst}"
    exit -1
fi

echo -e "${txtgrn}  << 유효성 체크완료! >>${txtrst}"
echo -e "${txtylw}=======================================${txtrst}"

docker build . -t ${IMAGE_NAME}:${TAG}
docker tag ${IMAGE_NAME}:${TAG} ${TARGET_REPOSITORY_NAME}:${TAG}
docker push ${TARGET_REPOSITORY_NAME}:${TAG}