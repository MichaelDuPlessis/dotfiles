#!/bin/bash
choice=$(printf "⏻ Shutdown\n↺ Restart" | hyprlauncher --dmenu)
case "$choice" in
  "⏻ Shutdown") systemctl poweroff ;;
  "↺ Restart") systemctl reboot ;;
esac
