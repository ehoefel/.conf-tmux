#!/usr/bin/env bash
#===============================================================================
#   Author: Wenxuan
#    Email: wenxuangm@gmail.com
#  Created: 2018-04-05 17:37
#===============================================================================

# $1: option
# $2: default value
tmux_get() {
    local value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

# $1: option
# $2: value
tmux_set() {
    tmux set-option -gq "$1" "$2"
}

# Options
right_arrow_icon=$(tmux_get '@tmux_power_right_arrow_icon' '')
left_arrow_icon=$(tmux_get '@tmux_power_left_arrow_icon' '')
upload_speed_icon=$(tmux_get '@tmux_power_upload_speed_icon' '')
download_speed_icon=$(tmux_get '@tmux_power_download_speed_icon' '')
session_icon="$(tmux_get '@tmux_power_session_icon' '')"
user_icon="$(tmux_get '@tmux_power_user_icon' '')"
time_icon="$(tmux_get '@tmux_power_time_icon' '')"
date_icon="$(tmux_get '@tmux_power_date_icon' '')"
show_upload_speed="$(tmux_get @tmux_power_show_upload_speed false)"
show_download_speed="$(tmux_get @tmux_power_show_download_speed false)"
show_web_reachable="$(tmux_get @tmux_power_show_web_reachable false)"
prefix_highlight_pos=$(tmux_get @tmux_power_prefix_highlight_pos)
time_format=$(tmux_get @tmux_power_time_format '%T')
date_format=$(tmux_get @tmux_power_date_format '%F')

# short for Theme-Colour
NC='#8280A5'
IC='#ff7f50'
TC=$NC

G00=#000000 #000
G01=#080808 #232
G02=#121212 #233
G03=#1c1c1c #234
G04=#262626 #235
G05=#303030 #236
G06=#3a3a3a #237
G07=#444444 #238
G08=#4e4e4e #239
G09=#585858 #240
G10=#626262 #241
G11=#6c6c6c #242
G12=#767676 #243

SUCCESS_COLOR=#91a580
ERROR_COLOR=#a59580

FG="$G10"
BG="$G04"

BG_TABS=$BG

FG_HEADER=$G04

BG_TAB_INACTIVE=$G05
FG_TAB_INACTIVE=$G12

FG_TAB_ACTIVE=white
BG_TAB_ACTIVE=$G12

BG_FOOTER_BATTERY=$G05
FG_FOOTER_BATTERY=$G10

BG_FOOTER_CLOCK=$G07
FG_FOOTER_CLOCK=$G12

BG_FOOTER_CALENDAR=$G10
FG_FOOTER_CALENDAR=white

# Status options
tmux_set status-interval 1
tmux_set status on
tmux_set status-position top

# Basic status bar colors
tmux_set status-fg "$FG"
tmux_set status-bg "$BG"
tmux_set status-attr none

# tmux-prefix-highlight
tmux_set @prefix_highlight_fg "$BG"
tmux_set @prefix_highlight_bg "$FG"
tmux_set @prefix_highlight_show_copy_mode 'on'
tmux_set @prefix_highlight_copy_mode_attr "fg=$TC,bg=$BG,bold"
tmux_set @prefix_highlight_output_prefix "#[fg=$TC]#[bg=$BG]$left_arrow_icon#[bg=$TC]#[fg=$BG]"
tmux_set @prefix_highlight_output_suffix "#[fg=$TC]#[bg=$BG]$right_arrow_icon"

#     
# Left side of status bar
tmux_set status-left-bg "$G04"
tmux_set status-left-fg "$G12"
tmux_set status-left-length 150

LS=$($HOME/.config/tmux/scripts/get_machine_title)

tmux_set status-left "$LS"

tmux_set status-right-length 150

# Right side of status bar
RS_BATTERY=""\
"#[bg=$BG_TABS,fg=$BG_FOOTER_BATTERY] $left_arrow_icon"\
"#[bg=$BG_FOOTER_BATTERY,fg=$FG_FOOTER_BATTERY,bold] #(battery_status)"\
"#[fg=$BG_TABS,bg=$BG_FOOTER_BATTERY]$left_arrow_icon"

RS_CLOCK=""\
"#[fg=$BG_FOOTER_CLOCK,bg=$BG_TABS]$left_arrow_icon"\
"#[fg=$FG_FOOTER_CLOCK,bg=$BG_FOOTER_CLOCK,bold] $time_icon"\
"#[nobold] $time_format "\
"#[fg=$BG_TABS,bg=$BG_FOOTER_CLOCK]$left_arrow_icon"

RS_CALENDAR=""\
"#[fg=$BG_FOOTER_CALENDAR,bg=$BG_TABS]$left_arrow_icon"\
"#[fg=$FG_FOOTER_CALENDAR,bg=$BG_FOOTER_CALENDAR,bold] $date_icon"\
"#[nobold] $date_format "

#RS="$RS_CLOCK$RS_CALENDAR"
RS=""
tmux_set status-right "$RS"

TITLE=""\
"#($HOME/.config/tmux/scripts/get_window_title '#{window_active}' '#{pane_current_command}' '#W' '#{pane_pid}' '#{b:pane_current_path}')"

# Window status
tmux_set window-status-format "$TITLE"
tmux_set window-status-current-format "$TITLE"

# Window separator
tmux_set window-status-separator ""

# Window status alignment
tmux_set status-justify left

# Current window status
tmux_set window-status-current-statys "fg=$TC,bg=$BG"

# Window color
tmux_set window-style "bg=$G00"
tmux_set window-active-style "bg=$G00"

# Pane border
tmux_set pane-border-style "fg=$G07,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$TC,bg=$BG"

# Pane number indicator
tmux_set display-panes-colour "$G07"
tmux_set display-panes-active-colour "$TC"

# Clock mode
tmux_set clock-mode-colour "$TC"
tmux_set clock-mode-style 24

# Message
tmux_set message-style "fg=$TC,bg=$BG"

# Command message
tmux_set message-command-style "fg=$TC,bg=$BG"

# Copy mode highlight
tmux_set mode-style "bg=$TC,fg=$FG"


