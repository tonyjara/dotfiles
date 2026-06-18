#!/usr/bin/env bash
# Bring Ghostty to the front and switch tmux to a specific session:window.pane.
# Invoked as the click action of an agent notification (terminal-notifier -execute).
# Args: <tmux-socket> <session-name> <window-id> <pane-id>
# Runs in macOS's minimal-PATH click context, so tmux is resolved with a fallback.
socket="$1"; sess="$2"; win="$3"; pane="$4"

open -b com.mitchellh.ghostty 2>/dev/null

tmux_bin="$(command -v tmux || echo /opt/homebrew/bin/tmux)"
cmd=("$tmux_bin")
[ -n "$socket" ] && cmd+=(-S "$socket")
[ -n "$sess" ] && "${cmd[@]}" switch-client -t "=$sess" 2>/dev/null
[ -n "$win" ]  && "${cmd[@]}" select-window -t "$win"  2>/dev/null
[ -n "$pane" ] && "${cmd[@]}" select-pane  -t "$pane" 2>/dev/null
exit 0
