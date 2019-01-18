#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS

if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi

docker build -f Dockerfile -t docker.io/$DOCKER_USER/cicd-buzz:$TAG .
docker push docker.io/$DOCKER_USER/cicd-buzz