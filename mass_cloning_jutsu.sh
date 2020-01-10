#!/bin/bash

echo "=============================================="
echo "Welcome To The Mass Github Cloning Tool"
echo "=============================================="

echo "Checking if you have brew..."
if hash brew; then
    echo "...brew is installed"
    else
        echo "...brew is installed"
        echo "Installing brew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
fi

echo "Checking if you have jq..."

if hash jq; then
    echo "...jq is installed"
    else
        echo "...jq is installed"
        echo "Installing jq via brew"
        brew install jq
fi

echo "Before we continue please make sure you have read the README for this repo"

echo "Creating Project Directory..."

DIRECTORY=${HOME}/Source

echo "Project Directory is located at $DIRECTORY"

read -p "Please enter you Github OAUTH Token: " token

export token

echo "Running mass clone script..."

npm i axios


repoArray=(`node graphQL_jutsu.js | jq .[].search.edges[].node.sshUrl`)

if [ ! -d "$DIRECTORY" ];then
    mkdir $DIRECTORY
    cd $DIRECTORY
else
    cd $DIRECTORY
fi

for element in ${repoArray[@]}; do
    repo=`echo "$element" | tr -d '"'`
    git clone $repo
done
