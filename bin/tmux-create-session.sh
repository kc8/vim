#!/usr/bin/env bash

# TODO add original author credit to this script

if [[ $# -eq 1 ]]; then
    selection=$1
else
    selection=$(find $PROJECT_DIR $NOTES_DIR $CONFIG_DIR $SQL_DIR -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selection ]];
then
    exit 0
fi

selectedBaseName=$(basename $selection)
isTmuxRunning=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $isTmuxRunning ]]; then
    tmux new-session -s $selectedBaseName -c $selection
    exit 0
fi

if ! tmux has-session -t=$selectedBaseName 2> /dev/null; then
    tmux new-session -ds $selectedBaseName -c $selection
fi

## Attach if inside, other wise switch clien
if [[ -z $TMUX ]]; then
    tmux  attach -d -t $selectedBaseName
else
    tmux switch-client -t $selectedBaseName
fi
