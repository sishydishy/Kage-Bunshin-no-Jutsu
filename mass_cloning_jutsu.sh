#!/bin/bash

echo "=============================================="
echo "Welcome To The Mass Github Cloning Tool"
echo "=============================================="

echo "Before we continue please make sure you have read the README for this repo"

# sleep 5

read -p "Please enter you Github OAUTH Token: " token

export token

echo "Running mass clone script..."

npm i axios

repoArray=(`node graphQL_jutsu.js | jq .[].search.edges[].node.sshUrl`)

for element in ${repoArray[@]}; do
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    repo=`echo "$element" | tr -d '"'`
    git clone $repo
done
