#!/bin/sh

title=$(hyprctl activewindow | grep title: | sed 's/[^:]*: //g')
class=$(hyprctl activewindow | grep class: | sed 's/[^:]*: //g')

# Check if a title was successfully extracted
echo $title
if [ -z "$title" ]; then
    echo "󰍹 Desktop"
elif [ $class = "kitty" ]; then
    echo "󰄛 Kitty"
elif [ $class = "firefox" ]; then
    echo "󰈹" $(echo "$title" | cut -c 1-$(( ${#title} - 18 )))
else
    echo "$title"
fi

exit 0
