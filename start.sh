#!/bin/sh

./github_pull.sh
./requirements.sh
./find_notebooks.sh

docker compose up