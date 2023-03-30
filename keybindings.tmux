###############################################################################
#    byobu's tmux f-key keybindings
#
#    Copyright (C) 2011-2014 Dustin Kirkland <kirkland@byobu.org>
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

# Meta key is ALT

# Tmux controls

bind -n M-n 'source ~/.config/tmux/tmux.conf'


# Navigation

bind -n M-Right "run-shell '~/.config/scripts/wm ping' \; next-window"
bind -n M-Left "run-shell '~/.config/scripts/wm ping' \; previous-window"

bind -n M-l "run-shell '~/.config/scripts/wm ping' \; next-window"
bind -n M-h "run-shell '~/.config/scripts/wm ping' \; previous-window"

# Window operations
bind -n M-, "run-shell '~/.config/scripts/wm ping' \; new-window -c '#{pane_current_path}' \; rename-window ''"
bind -n M-r "command-prompt \"rename-window '%%'\" \; run-shell '~/.config/scripts/wm ping'"
bind -n M-. "run-shell '~/.config/scripts/wm ping' \; kill-pane"

# Copy mode 
bind-key -n              M-v    copy-mode
bind-key -T copy-mode-vi v      send-keys -X begin-selection
bind-key -T copy-mode-vi Escape send-keys -X cancel
bind-key -T copy-mode-vi Home   send-keys -X start-of-line
bind-key -T copy-mode-vi End    send-keys -X end-of-line
bind-key -T copy-mode-vi Left   send-keys -X cursor-left
bind-key -T copy-mode-vi Right  send-keys -X cursor-right
bind-key -T copy-mode-vi Down   send-keys -X cursor-down
bind-key -T copy-mode-vi Up     send-keys -X cursor-up
bind-key -T copy-mode-vi Enter  send-keys -X copy-pipe-and-cancel "tr -d '\\n' | wl-copy"

# Deprecated
# Select by number
bind -n M-1 "run-shell '~/.config/scripts/wm ping'\; select-window -t 1"
bind -n M-2 "run-shell '~/.config/scripts/wm ping'\; select-window -t 2"
bind -n M-3 "run-shell '~/.config/scripts/wm ping'\; select-window -t 3"
bind -n M-4 "run-shell '~/.config/scripts/wm ping'\; select-window -t 4"
bind -n M-5 "run-shell '~/.config/scripts/wm ping'\; select-window -t 5"
bind -n M-6 "run-shell '~/.config/scripts/wm ping'\; select-window -t 6"
bind -n M-7 "run-shell '~/.config/scripts/wm ping'\; select-window -t 7"
bind -n M-8 "run-shell '~/.config/scripts/wm ping'\; select-window -t 8"
bind -n M-9 "run-shell '~/.config/scripts/wm ping'\; select-window -t 9"
