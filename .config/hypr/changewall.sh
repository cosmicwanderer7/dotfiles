#!/bin/bash

file_path="hyprland.conf"       # Hardcoded file path
line_number=40               # Hardcoded line number
new_content='exec = swaybg -m fill -i ~/.config/hypr/endeavour.png' # Hardcoded new content
original_content='exec = swaybg -m fill -i ~/.config/hypr/change.jpg' # Hardcoded original content
flag_file=".toggle_flag"     # Flag file to keep track of state

if [ ! -f "$file_path" ]; then
    exit 1
fi

if ! grep -q "^" "$file_path"; then
    exit 1
fi

if [ -f "$flag_file" ]; then
    current_state=$(cat "$flag_file")
else
    current_state="original"
fi

if [ "$current_state" == "original" ]; then
    new_content="$new_content"
    echo "new" > "$flag_file"
else
    new_content="$original_content"
    echo "original" > "$flag_file"
fi

sed -i "${line_number}s#.*#$new_content#" "$file_path"
