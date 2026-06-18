#!/usr/bin/env bash
# Codex CLI `notify` handler (configured in ~/.codex/config.toml).
# Codex invokes:  codex-notify.sh '<json-event>'
# We forward only turn-completion events to the shared notifier with the codex icon.
json="${1:-}"
type=$(printf '%s' "$json" | jq -r '.type // empty' 2>/dev/null)
case "$type" in
  agent-turn-complete) ;;
  *) exit 0 ;;
esac
exec "$HOME/.config/tmux/scripts/agent-notify.sh" codex
