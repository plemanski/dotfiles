#!/bin/bash

run() {
    if ! pgrep -f "$1" ;
    then
	    "$@"&
	fi
}

run picom -b --config $HOME/.config/picom/picom.conf
