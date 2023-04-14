#!/bin/bash

HTB_DATA_DIR=~/htb/boxes

if [[ $1 ]]; then
	a=1
else
	echo "Usage: $0 <Box name>"
	exit 1
fi

if [[ -d $HTB_DATA_DIR/$1 ]]; then
	b=1
else 
	htb-init $1
fi

tmux new-session -s htb -d -n win1
tmux new-window -t htb -d -n win2
tmux new-window -t htb -d -n win3
tmux new-window -t htb -d -n vpn


tmux select-window -t htb:win1
tmux split-window -h
tmux send-keys "cd $HTB_DATA_DIR/$1; clear" Enter 
tmux split-window -v
tmux send-keys "cd $HTB_DATA_DIR/$1; clear" Enter 
tmux select-layout main-vertical

tmux select-window -t htb:win2
tmux send-keys "cd $HTB_DATA_DIR/$1; clear" Enter 
tmux split-window -v
tmux send-keys "cd $HTB_DATA_DIR/$1; clear" Enter 

tmux send-keys -t htb:win3 "cd $HTB_DATA_DIR/$1; clear" Enter

tmux select-window -t htb:vpn
tmux send-keys -t htb:vpn "echo <SUDO_PASS>| sudo -S /usr/sbin/openvpn /home/kali/Documents/htb/lab_f3nr1r.ovpn" Enter
tmux split-window -v
tmux send-keys -t htb:vpn "cd $HTB_DATA_DIR/$1/www;/usr/bin/python3 -m http.server 8081" Enter

tmux select-window -t htb:win1
tmux attach -t htb -c $HTB_DATA_DIR/$1
