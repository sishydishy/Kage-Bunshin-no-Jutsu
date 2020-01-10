#!/bin/bash

echo "=============================================="
echo "Welcome To The Mass Github Cloning Tool"
echo "=============================================="

echo "Before we continue please make sure you have read the README for this repo"

read -p "Please enter you Github OAUTH Token: " token

export token






echo "Running mass clone script..."

# repoArray=(
#     git@github.com:MYOB-Technology/PS-Collaboration-Service.git
#     git@github.com:MYOB-Technology/ps-documentmanager-service.git
#     git@github.com:MYOB-Technology/ps-document-module.git
#     git@github.com:MYOB-Technology/ps-collaboration-portal-module.git
#     git@github.com:MYOB-Technology/ps-collaboration-document-module.git
#     git@github.com:MYOB-Technology/ps-practice-task-module.git
#     git@github.com:MYOB-Technology/ps-collaboration-components.git
# )

# for element in ${repoArray[@]}; do
#     echo "Clonning Repo $element"
#     git clone $element
# done
npm i axios

node graphQL_jutsu.js | jq .[].search.edges[].node.sshUrl


# echo "hello"

# read -p "Name: " name

# export name

# echo $name

# node graphQL_jutsu.js