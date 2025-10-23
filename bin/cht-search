#!/usr/bin/env bash

LANGUAGE=`echo "java golang scala cpp c javascript nodejs" | tr ' ' '\n'`
TOOLS=`echo "xargs find mv sed awk" | tr ' ' '\n'`
selected=`printf "$LANGUAGE\n$TOOLS" | fzf`
read -p "Enter Search: " query

if printf $LANGUAGE | grep -qs $selected; then
  tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while[ : ]; do sleep 1; done"
else
  curl -s cht.sh/$selected/-$query | less
fi
