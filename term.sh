#!/bin/sh

# based off i3-sensible-terminal

for terminal in "$TERMINAL" x-terminal-emulator urxvt rxvt termit terminator Eterm aterm xterm gnome-terminal roxterm xfce4-terminal termite lxterminal mate-terminal terminology st; do
		if command -v "$terminal" > /dev/null 2>&1; then
				exec "$terminal" "$@"
		fi
done

echo "No terminal found!"
