#!/usr/bin/env bash

echo
echo Usage:
echo Commit changes in the target folder and then start this from repository root
echo

if [ -z "$1" ]
then
echo Usage: git-branch folder-name
exit
fi

ssh-add -l

if [ $? -ne 0 ]
then
echo ERROR: Add SSH key first!
exit
fi

REPO=git@github.com:andrewmed/${1%/}.git

echo
echo Task:
echo Will be filtering directory $1
echo and pushing it to $REPO
echo
echo Press Enter to start

read

set -e -x

git filter-branch -f --prune-empty --subdirectory-filter $1 HEAD
git remote add origin $REPO
git push -u origin master

echo Resetting back...
git reset --hard refs/original/refs/heads/master
git remote rm origin


echo SUCCESS!