#!/bin/sh

STATE_REPO_REMOTE=${1:-git@github.com:ondrejsika/terraform-do-kubernetes-example--state.git}

cd "$(dirname $0)"

[ ! -d .state ] && \
  git clone $STATE_REPO_REMOTE $STATE_REPO_DIR .state

[ -f terraform.tfstate ] && \
  mv terraform.tfstate .state/terraform.tfstate || \
    touch .state/terraform.tfstate
[ -f terraform.tfstate.backup ] && \
  mv terraform.tfstate.backup .state/terraform.tfstate.backup || \
    touch .state/terraform.tfstate.backup

ln -s .state/terraform.tfstate .
ln -s .state/terraform.tfstate.backup .
