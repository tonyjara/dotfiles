#!/usr/bin/env bash
# Notify when an agent CLI (Claude Code / Codex) finishes or needs attention.
#   $1 = tool key (claude|codex) -> selects icon icons/<tool>.png and the title
#   $2 = optional status (shown as subtitle, e.g. "Needs your input"); omit when done
# The notification body is the chat topic; the title + icon identify the tool.
# Wired from: Claude Code Stop/Notification hooks (~/.claude/settings.json)
#         and Codex `notify` via codex-notify.sh (~/.codex/config.toml).

tool="${1:-claude}"
status="${2:-}"
icon="$HOME/.config/tmux/icons/$tool.png"

case "$tool" in
  codex)  title="Codex" ;;
  claude) title="Claude Code" ;;
  *)      title="$tool" ;;
esac

# --- which chat is this? (the notification body) ---
# Agent CLIs set the terminal title to the chat topic; tmux exposes it as
# pane_title. Strip the leading spinner glyph; fall back to project + branch.
ctx=""
if [ -n "$TMUX" ] && [ -n "$TMUX_PANE" ]; then
  raw=$(tmux display-message -p -t "$TMUX_PANE" '#{pane_title}' 2>/dev/null)
  ctx=$(printf '%s' "$raw" | sed -E 's/^[^[:alnum:]]+//; s/[[:space:]]+$//')
fi
if [ -z "$ctx" ]; then
  proj=$(basename "$PWD")
  br=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  ctx="$proj${br:+ ($br)}"
fi

# --- tmux: status-line toast + bell so the window flags when you're elsewhere ---
if [ -n "$TMUX" ]; then
  tmux display-message "🔔 ${status:+$status — }$ctx" 2>/dev/null

  if [ -n "$TMUX_PANE" ]; then
    tty=$(tmux display-message -p -t "$TMUX_PANE" '#{pane_tty}' 2>/dev/null)
  else
    tty=$(tmux display-message -p '#{pane_tty}' 2>/dev/null)
  fi
  [ -n "$tty" ] && printf '\a' > "$tty" 2>/dev/null
fi

# --- macOS: clickable popup with per-tool icon; click jumps to Claude/Codex's pane ---
if command -v terminal-notifier >/dev/null 2>&1; then
  sock="${TMUX%%,*}"; sess=""; win=""; pane=""
  if [ -n "$TMUX" ]; then
    coords=$(tmux display-message -p -t "$TMUX_PANE" '#{session_name}|#{window_id}|#{pane_id}' 2>/dev/null)
    IFS='|' read -r sess win pane <<< "$coords"
  fi
  focus="$HOME/.config/tmux/scripts/agent-focus.sh"
  args=(-title "$title" -message "$ctx" -sound Glass
        -execute "'$focus' '$sock' '$sess' '$win' '$pane'")
  [ -n "$status" ] && args+=(-subtitle "$status")
  # appIcon + contentImage maximise the chance the tool icon shows across macOS versions.
  [ -f "$icon" ] && args+=(-appIcon "$icon" -contentImage "$icon")
  terminal-notifier "${args[@]}" >/dev/null 2>&1
elif command -v osascript >/dev/null 2>&1; then
  sub=""; [ -n "$status" ] && sub=" subtitle \"${status//\"/\\\"}\""
  osascript -e "display notification \"${ctx//\"/\\\"}\" with title \"$title\"$sub sound name \"Glass\"" >/dev/null 2>&1
fi

exit 0
