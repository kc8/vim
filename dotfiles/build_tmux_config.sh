#!/usr/bin/env bash
set -euo pipefail

PLATFORM=$(uname -s)

if [ -f "$HOME/.tmux.conf" ]; then
    cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.autobackup"
fi

# default to linux
COPY_PASTE_SETTINGS="bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'"

# we are on mac...
if [ "$PLATFORM" = "Darwin" ]; then
  COPY_PASTE_SETTINGS="bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'pbcopy'"
fi

cat > "$HOME/.tmux.conf" << EOF
set -g default-terminal "xterm-256color"

unbind C-b
set -g prefix C-a
bind C-a send-prefix
set -sg escape-time 0

setw -g mode-keys vi
setw -g mouse on

set-option -g status-bg colour235
set-option -g status-fg colour179

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

unbind [
bind v copy-mode

set-window-option -g mode-keys vi
bind -T copy-mode-vi v send-keys -X begin-selection

$COPY_PASTE_SETTINGS

bind t new-window

# first window will be @ 1 instead of 0
set -g base-index 1

set -g mouse on

bind r source-file ~/.tmux.conf \; display-message "tmux.conf"

set -g history-limit 15000
EOF
