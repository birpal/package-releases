#!/bin/bash
set -e

if [[ $TRAVIS_BRANCH == 'master' ]]; then
  
  rm -rf .git
  git init
  git clean -dfx
  git remote add origin https://github.com/birpal/package-releases.git
  git fetch origin
  git clone https://github.com/$TRAVIS_REPO_SLUG.git $TRAVIS_REPO_SLUG
  git checkout $TRAVIS_BRANCH


  git config credential.helper store
  echo "https://${RELEASE_GH_USERNAME}:${RELEASE_GH_TOKEN}@github.com/birpal/package-releases.git" > ~/.git-credentials
  echo "//registry.npmjs.org/:_authToken=\${NPM_TOKEN}" > .npmrc
  npm prune

  git config --global user.email $RELEASE_GH_EMAIL
  git config --global user.name $RELEASE_GH_USERNAME
  git config --global push.default simple
  echo "git branch"

  git fetch --tags
  git branch -u origin/$TRAVIS_BRANCH
  git fsck --full #debug
  echo "npm whoami"
  npm whoami #debug
  echo "git config --list"
  git config --list #debug
fi
