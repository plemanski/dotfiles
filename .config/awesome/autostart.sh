#!/usr/bin/bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom -b --config $HOME/.config/picom/picom.conf
#run `bash -c '[[ ! -z "$LAPTOP" ]] && xinput set-prop 19 325 1.0'`
#run `bash -c '[[ -z "$LAPTOP" ]] && mpv --no-video ~/.config/awesome/fishlive/sounds/startup-snd-1.mp3 &'`
