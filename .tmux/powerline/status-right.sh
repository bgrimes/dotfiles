#!/usr/bin/env bash
# This script prints a string will be evaluated for text attributes (but not shell commands) by tmux. It consists of a bunch of segments that are simple shell scripts/programs that output the information to show. For each segment the desired foreground and background color can be specified as well as what separator to use. The script the glues together these segments dynamically so that if one script suddenly does not output anything (= nothing should be shown) the separator colors will be nicely handled.

# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Segment
# Comment/uncomment the register function call to enable or disable a segment.

declare -A adium
adium+=(["script"]="${segments_path}/adium.sh")
adium+=(["foreground"]="colour196")
adium+=(["background"]="colour236")
adium+=(["separator"]="${separator_left_bold}")
#adium+=(["separator_fg"]="white")
register_segment "adium"

declare -A daemons
daemons+=(["script"]="${segments_path}/daemons.sh")
daemons+=(["foreground"]="colour37")
daemons+=(["background"]="colour234")
daemons+=(["separator"]="${separator_left_bold}")
#ademons+=(["separator_fg"]="colour253")
register_segment "daemons"

declare -A load
load+=(["script"]="${segments_path}/load.sh")
load+=(["foreground"]="colour167")
load+=(["background"]="colour237")
load+=(["separator"]="${separator_left_bold}")
register_segment "load"

declare -A battery
if [ "$PLATFORM" == "mac" ]; then
	battery+=(["script"]="${segments_path}/battery_mac.sh")
else
	battery+=(["script"]="${segments_path}/battery.sh")
fi
battery+=(["foreground"]="colour127")
battery+=(["background"]="colour137")
battery+=(["separator"]="${separator_left_bold}")
register_segment "battery"

declare -A time
time+=(["script"]="${segments_path}/time.sh")
time+=(["foreground"]="colour136")
time+=(["background"]="colour235")
time+=(["separator"]="${separator_left_bold}")
#time+=(["separator_fg"]="default")
register_segment "time"

# Print the status line in the order of registration above.
print_status_line_right

exit 0
