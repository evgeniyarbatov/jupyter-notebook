#!/bin/bash

LOCAL_GIT_DIR='..'
GITHUB_USERNAME="evgeniyarbatov"

gh repo list $GITHUB_USERNAME | while read -r repo _; do
  cd $LOCAL_GIT_DIR
  repo_dir=$(basename "$repo")
  cd "$repo_dir"
  if ! git diff-index --quiet HEAD --; then
    echo "$repo_dir has local changes"
    git add .
    git commit -m "Saved"
    git push
  fi
done