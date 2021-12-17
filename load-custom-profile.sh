#!/bin/bash

# verify $PROFILE_REPO_PATH is empty
if [[ -z $PROFILE_REPO_PATH ]]; then
    echo "no PROFILE_REPO_PATH provided"
    return -1
fi

# verify the path at $PROFILE_REPO_PATH exists
if [ !d-d $PROFILE_REPO_PATH ]; then
    echo "PROFILE_REPO_PATH path does not exists"
    return -1
fi

# variables that depend on the $PROFILE_REPO_PATH
#   JSON FILES
export SETTINGS_FILE="$PROFILE_REPO_PATH/settings.json"
export BOOKMARKS_FILE="$PROFILE_REPO_PATH/bookmarks.json"
export SCRIPTS_FOLDER="$PROFILE_REPO_PATH/scripts"

# export variables
for command in "$(jq -r 'to_entries | .[] | "export " + .key + "=" + (.value | @sh) ' <$SETTINGS_FILE)"; do
    eval $command
done

# source functions and aliases
for i in $SCRIPTS_FOLDER/*.sh; do source "$i"; done

# List the bookmarks when opening the terminal
listBookmarks
