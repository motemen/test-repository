#!/bin/bash

set -e

pr_number=$(git show --pretty=%s | sed -n 's/^Merge pull request #\([0-9]\{1,\}\) .*/\1/p')

if [ -n "$pr_number" ]; then
  new_version=$(gobump patch -w -v | jq -r '.[]')

  if ! git diff --exit-code ./*.go; then
    git config --global user.email 'motemen@gmail.com'
    git config --global user.name  'gobump-bot'

    git add ./*.go
    git commit -m "bump version to $new_version"
    git push "https://$GITHUB_TOKEN@github.com/motemen/test-repository" HEAD:master >/dev/null 2>&1

    ghr "v$new_version" --token $GITHUB_TOKEN --replace --draft dist/
  fi
fi
