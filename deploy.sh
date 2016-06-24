#!/bin/bash
set -o errexit

if ! [[ "${TRAVIS_PULL_REQUEST}" = "false" && "${TRAVIS_BRANCH}" = "master" ]]; then
    echo -e "Skipping site push (TRAVIS_PULL_REQUEST=${TRAVIS_PULL_REQUEST} TRAVIS_BRANCH=${TRAVIS_BRANCH})\n"
    exit 0
fi

if [ -z "${GH_TOKEN}" ]; then
    echo -e  "\$GH_TOKEN environment variable not set, or not repo owner."
    exit 0
fi

git config user.name "Travis Build"
echo "Updating remotes..."
git remote add deploy "https://${GH_TOKEN}@github.com/OpenIndiana/oi-docs.git" &>/dev/null || echo "Remote deploy already exists:"
git remote -v

echo "Running mkdocs gh-deploy"
mkdocs gh-deploy --verbose --clean --remote-branch gh-pages --remote-name deploy
