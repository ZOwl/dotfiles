#!/bin/bash

sleep 0.5
xsetroot -solid black &

export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"

DEFAULT_SESSION=awesome
case $1 in
  awesome) exec awesome ;;
  fvwm-crystal) exec fvwm-fvwm-crystal ;;
  fvwm) exec fvwm ;;
  *) exec $DEFAULT_SESSION ;;
esac
