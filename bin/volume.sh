# !/usr/bin/env bash

SINK="@DEFAULT_SINK@"
STEP=5

case "$1" in
    up)
        volume=$(pactl get-sink-volume "$SINK" | head -n1 | grep -o '[0-9]\+%' | head -n1 | tr -d '%')
        new_volume=$((volume + STEP))

        (( new_volume > 100 )) && new_volume=100

        pactl set-sink-volume "$SINK" "${new_volume}%"

        # Unmute when raising from 0%
        if (( new_volume > 0 )); then
            pactl set-sink-mute "$SINK" 0
        fi
        ;;

    down)
        echo "$new_volume" | xob -s volume

        volume=$(pactl get-sink-volume "$SINK" | head -n1 | grep -o '[0-9]\+%' | head -n1 | tr -d '%')
        new_volume=$((volume - STEP))
        (( new_volume < 0 )) && new_volume=0

        pactl set-sink-volume "$SINK" "${new_volume}%"

        # Mute when reaching 0%
        if (( new_volume == 0 )); then
            swayosd-client --output-volume mute
            pactl set-sink-mute "$SINK" 1
            dunstify "Muted" -a Volume -i volume-muted
        fi
        ;;

    mute)
        echo "$new_volume" | xob -s volume
        pactl set-sink-mute "$SINK" toggle
        if ((new_volume == 0)); then
          dunstify "Muted" -a Volume -i volume-muted
        fi
        ;;

    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac

if ((new_volume != 0)); then
  if ((new_volume < 30)); then
    dunstify "" -a Volume -h int:value:$new_volume -i volume-low
  elif ((new_volume < 60)); then
    dunstify "" -a Volume -h int:value:$new_volume -i volume-medium
  else
    dunstify "" -a Volume -h int:value:$new_volume -i volume-high
  fi
fi
