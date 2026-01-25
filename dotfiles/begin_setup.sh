#!/usr/bin/env bash
set -euo pipefail

mkdir -p ~/.config/ghostty
ln ~/.config/ghostty/config  ./ghostty/config

mkdir -p ~/projects/knowledge-base/man

ln dotfiles/.zshrc ~/.zshrc
