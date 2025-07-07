#!/bin/bash

# New repo URL
new_repo="git@gitlab.com/group-name/repo-name"

# Check if app.txt exists
if [ ! -f app.txt ]; then
  echo "[ERROR] app.txt not found."
  exit 1
fi

# loop through app.txt
while IFS= read -r app || [[ -n "$app" ]]; do
  # Check if app is empty
  if [[ -z "$app" ]]; then
    continue
  fi

  echo "Updating $app ..."
  kubectl patch applications.argoproj.io "$app" -n argocd --type merge -p "{
    \"spec\": {
      \"source\": {
        \"repoURL\": \"${new_repo}\",
        \"path\": \"dev/${app}\"
      }
    }
  }"
done < app.txt
