# !/usr/bin/env bash

case "$1" in
  up)
    brightnessctl set +10%
    ;;
  down)
    brightnessctl set 10%-
    ;;
  *)
    echo "Usage: $0 {up|down}"
    exit 1
    ;;
esac

brightnessctl -m | grep -o '[0-9]\+%' | tr -d '%'
