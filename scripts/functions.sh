#!/bin/bash

listBookmarks() {
    local pathSelected=$(cat $BOOKMARKS_FILE |
        jq -r '.[]' |
        fzf)

    if [[ -n "$pathSelected" ]]; then
        cd $pathSelected
    else
        echo "no bookmark selected"
    fi
}

openRepoUrl() {
    local gitUrl=$(git remote get-url --all origin)
    local repoUrl="${gitUrl%".git"}" # Removing .git prefix
    if [[ -n "$repoUrl" ]]; then
        echo "repoUrl:$repoUrl"
        xdg-open $repoUrl
    fi
}

# REQUIRES fzf, this list the current folder interactively

lsf() {
    local chosenDir=$(ls | fzf)
    if [[ -n "$chosenDir" ]]; then
        cd $chosenDir
    fi
}
