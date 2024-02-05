#!/bin/sh
session="Javascript"
tmux new-session -A -d -s $session
window=1
tmux rename-window -t $session:$window 'nvim'
tmux send-keys 'nvim .' C-m
window=2
tmux new-window -t $session:$window -n 'lazygit'
tmux send-keys 'lazygit' C-m
tmux rename-window 'lazygit'
tmux next-window
tmux attach-session -t $session
