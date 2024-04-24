#!/bin/bash

LOCAL_GIT_DIR='..'
GITHUB_USERNAME="evgeniyarbatov"

cd $LOCAL_GIT_DIR

gh repo list $GITHUB_USERNAME | while read -r repo _; do
  repo_dir=$(basename "$repo")
  echo "Clone $repo into $repo_dir"

  gh repo clone "$repo" "$repo_dir" -- -q 2>/dev/null || (
    echo "Pull $repo"
    cd "$repo_dir"
    git checkout -q main 2>/dev/null || true
    git checkout -q master 2>/dev/null || true
    git pull -q
  )
done