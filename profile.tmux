###############################################################################
#    tmux common profile
#      This tmux configuration profile is intended to correspond to Byobu's
#      traditional GNU Screen profile
#
#    Copyright (C) 2011-2014 Dustin Kirkland
#
#    Authors: Dustin Kirkland <kirkland@byobu.org>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, version 3 of the License.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

# Initialize environment, clean up
set -g default-shell /bin/bash
set -g default-terminal tmux-256color
set -g base-index 1
set -g pane-base-index 1
set -s escape-time 0
set -s set-clipboard on

# Add ^A, F12 to the prefix list
set -g prefix ^E
# Note, prefix2 only available in tmux 1.6+
set -g prefix2 F12

# Keybindings
source ~/.config/tmux/keybindings.tmux
set-window-option -g xterm-keys on

set -g @tmux_power_date_format '%d/%m/%y'
set -g @tmux_power_time_format '%H:%M'
set -g @tmux_power_theme '#8280A5' # dark slate blue
run-shell "~/.config/tmux/theme.tmux"


set -g window-active-style "bg=#141414"
set -g pane-border-style "bg=#181818 fg=#181818"
set -g pane-active-border-style "bg=#181818 fg=#181818"
set -g pane-border-status off
set-hook -g window-layout-changed 'set-window -F pane-border-status off'

set -g -q mouse on
