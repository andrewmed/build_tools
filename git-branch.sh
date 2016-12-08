#!/usr/bin/env bash
set -e

echo
echo Commit first the changes in the target folder

if [ -z "$2" ]
then
echo Then run: git-branch folder-name url-of-remote-repository
exit
fi

echo Will be filtering directory $1 and pushing it to $2
echo Press enter to continue...

read

git filter-branch --prune-empty --subdirectory-filter $1 HEAD
git remote add origin $2
git push -u origin master

echo Resetting back...
git reset --hard refs/original/refs/heads/master
git remote rm origin


:end