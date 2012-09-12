#!/usr/bin/env bash
#Print the status-left for tmux.

# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Segments

declare -A tmux_session_info
tmux_session_info+=(["script"]="${segments_path}/tmux_session_info.sh")
tmux_session_info+=(["foreground"]="colour234")
tmux_session_info+=(["background"]="colour148")
tmux_session_info+=(["separator"]="${separator_right_bold}")
#tmux_session_info+=(["separator_fg"]="default")
register_segment "tmux_session_info"

declare -A hostname
hostname+=(["script"]="${segments_path}/hostname.sh")
hostname+=(["foreground"]="colour0")
hostname+=(["background"]="colour33")
hostname+=(["separator"]="${separator_right_bold}")
register_segment "hostname"

declare -A vcs_branch
vcs_branch+=(["script"]="${segments_path}/vcs_branch.sh")
vcs_branch+=(["foreground"]="colour5")
vcs_branch+=(["background"]="colour29")
vcs_branch+=(["separator"]="${separator_right_bold}")
register_segment "vcs_branch"

declare -A now_playing
now_playing+=(["script"]="${segments_path}/np_mac.sh")
now_playing+=(["foreground"]="colour37")
now_playing+=(["background"]="colour234")
now_playing+=(["separator"]="${separator_right_bold}")
register_segment "now_playing"

# Print the status line in the order of registration above.
print_status_line_left

exit 0
