#!/bin/bash

set -e

pr_number=$(git show --pretty=%s | sed -n 's/^Merge pull request #\([0-9]\{1,\}\) .*/\1/p')

repo_owner=motemen
repo_name=test-repository
committer_email=motemen+gobump-bot@gmail.com
committer_name=motemen

if [ -n "$pr_number" ]; then
  new_version=$(gobump patch -w -v | jq -r '.[]')

  if ! git diff --exit-code ./*.go; then
    git config --global user.email "$committer_email"
    git config --global user.name  "$committer_name"

    git add ./*.go
    git commit -m "bump version to $new_version"
    git push "https://$GITHUB_TOKEN@github.com/$repo_owner/$repo_name" HEAD:master >/dev/null 2>&1

    ghr --user "$repo_owner" --token "$GITHUB_TOKEN" --replace --draft "v$new_version" dist/
  fi
fi
