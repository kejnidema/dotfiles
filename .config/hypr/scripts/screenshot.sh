#!/bin/bash
#  ____                               _           _    
# / ___|  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_  
# \___ \ / __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __| 
#  ___) | (__| | |  __/  __/ | | \__ \ | | | (_) | |_  
# |____/ \___|_|  \___|\___|_| |_|___/_| |_|\___/ \__| 
#                                                      
# Based on https://github.com/hyprwm/contrib/blob/main/grimblast/screenshot.sh 
# ----------------------------------------------------- 

# Screenshots will be stored in $HOME by default.
# The screenshot will be moved into the screenshot directory

# Add this to ~/.config/user-dirs.dirs to save screenshots in a custom folder: 
# XDG_SCREENSHOTS_DIR="$HOME/Screenshots"

prompt='Screenshot'
mesg="DIR: ~/Screenshots"

# Screenshot Filename
source ~/.config/ml4w/settings/screenshot-filename.sh

# Screenshot Folder
source ~/.config/ml4w/settings/screenshot-folder.sh

# Screenshot Editor
export GRIMBLAST_EDITOR="$(cat ~/.config/ml4w/settings/screenshot-editor.sh)"

# Example for keybindings
# bind = SUPER, p, exec, grimblast save active
# bind = SUPER SHIFT, p, exec, grimblast save area
# bind = SUPER ALT, p, exec, grimblast save output
# bind = SUPER CTRL, p, exec, grimblast save screen

# Options
option_1="Immediate"
option_2="Delayed"

option_capture_1="Capture Everything"
option_capture_2="Capture Active Display"
option_capture_3="Capture Selection"

option_time_1="5s"
option_time_2="10s"
option_time_3="20s"
option_time_4="30s"
option_time_5="60s"
#option_time_4="Custom (in seconds)" # Roadmap or someone contribute :)

list_col='1'
list_row='2'

copy='Copy'
save='Save'
copy_save='Copy & Save'
edit='Edit'

# Execute Command
run_cmd() {
    grimblast --notify "copysave" "area" $NAME 
    if [ -f $HOME/$NAME ] ;then
        if [ -d $screenshot_folder ] ;then
            mv $HOME/$NAME $screenshot_folder/
        fi
    fi
}

run_cmd
