#!/bin/bash

echo -e "deploying updates to Github.."

# Build the project.
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin source
git subtree push --force --prefix=public git@github.com:cloud-native-java/cloud-native-java.github.io.git master
