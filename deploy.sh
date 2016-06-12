#!/bin/bash
set -o errexit -o nounset

if ! [[ "$TRAVIS_PULL_REQUEST" = "false" && "$TRAVIS_BRANCH" = "master" ]]; then
    echo -e "Skipping site push (TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST TRAVIS_BRANCH=$TRAVIS_BRANCH)\n"
    exit 0
fi

git config user.name "Travis Build"
echo "Updating remotes..."
git remote add deploy "https://$GH_TOKEN@github.com/makruger/website-2.0.git" || echo "Remote deploy already exists:"
git remote -v

echo "Running mkdocs gh-deploy"
mkdocs gh-deploy --verbose --clean --remote-branch gh-pages --remote-name deploy

echo "Pushing to master..."
git push deploy gh-pages:gh-pages --force
