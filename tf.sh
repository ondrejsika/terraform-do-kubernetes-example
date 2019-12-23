#!/bin/sh

GIT_COMMIT_FLAGS=-S

cd "$(dirname $0)"

git -C .state pull origin master && \
    terraform $@

git -C .state add . && \
    git -C .state commit -m "[terraform] update state" $GIT_COMMIT_FLAGS && \
    git -C .state push origin master
