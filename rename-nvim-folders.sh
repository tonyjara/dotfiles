#!/bin/bash
# required
# mv ~/.config/nvim{,.bak}
#
# # optional but recommended
# mv ~/.local/share/nvim{,.bak}
# mv ~/.local/state/nvim{,.bak}
# mv ~/.cache/nvim{,.bak}

new="$HOME/.config/nvim.new"
newShare="$HOME/.local/share/nvim.new"
newState="$HOME/.local/state/nvim.new"
newCache="$HOME/.cache/nvim.new"

back="$HOME/.config/nvim.backup"
backShare="$HOME/.local/share/nvim.backup"
backState="$HOME/.local/state/nvim.backup"
backCache="$HOME/.cache/nvim.backup"

vim="$HOME/.config/nvim"
share="$HOME/.local/share/nvim"
state="$HOME/.local/state/nvim"
cache="$HOME/.cache/nvim"

rename_folder() {
    if [ -d "$new" ] && [ -d "$newShare" ] && [ -d "$newState" ] && [ -d "$newCache" ] && [ -d "$vim" ] && [ -d "$state" ] && [ -d "$share" ] && [ -d "$cache" ]; then
        mv "$vim" "$back"
        mv "$share" "$backShare"
        mv "$state" "$backState"
        mv "$cache" "$backCache"
        echo "Renamed VIM to BACKUP."
        mv "$new" "$vim"
        mv "$newShare" "$share"
        mv "$newState" "$state"
        mv "$newCache" "$cache"
        echo "Renamed NEW to VIM."
        exit
    else
        echo "Error: NEW does not exist. Going to try BACKUP"
    fi

    if [ -d "$back" ] && [ -d "$backShare" ] && [ -d "$backState" ] && [ -d "$backCache" ] && [ -d "$vim" ] && [ -d "$state" ] && [ -d "$share" ] && [ -d "$cache" ]; then
        mv "$vim" "$new"
        mv "$share" "$newShare"
        mv "$state" "$newState"
        mv "$cache" "$newCache"
        echo "Renamed VIM to NEW."
        mv "$back" "$vim"
        mv "$backState" "$state"
        mv "$backShare" "$share"
        mv "$backCache" "$cache"
        echo "Renamed BACKUP to VIM."
    else
        echo "Error: $back does not exist."
    fi

}

rename_folder 


