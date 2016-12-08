#!/usr/bin/env bash

echo
echo Commit the changes in the target folder and then start this script from repository root
echo Do not forget to unlock ssh password for git

if [ -z "$2" ]
then
echo Usage: git-branch folder-name url-of-remote-repository
exit
fi

echo Will be filtering directory $1 and pushing it to $2
echo

set -e -x

git filter-branch -f --prune-empty --subdirectory-filter $1 HEAD
git remote add origin $2
git push -u origin master

echo Resetting back...
git reset --hard refs/original/refs/heads/master
git remote rm origin


echo SUCCESS!