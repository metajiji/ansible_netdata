#!/bin/sh

git filter-branch --env-filter '
#OLD_EMAIL="metajiji@gmai.com"
OLD_EMAIL="metall@pushwoosh.com"
CORRECT_NAME="Denis Kadyshev"
CORRECT_EMAIL="metajiji@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]; then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]; then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

# Known issues:
# Issue: Cannot create a new backup.
# A previous backup already exists in refs/original/
# Force overwriting the backup with -f
# Solution: rm -rf .git/refs/original/
