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

bind -n M-n  if-shell -F "#{pane_marked_set}" "send-keys 'M-n'"  'source ~/.tmux.conf'


# Navigation

bind -n M-Up if-shell -F "#{pane_marked_set}" "set -g status on \; set -g pane-border-status top \; select-pane -M \; send-keys 'M-Up'" ""
bind -n M-Down if-shell -F "#{pane_marked_set}" "send-keys 'M-Down'" "set -g status off \; set -gu pane-border-status \; select-pane -m"
bind -n M-Right if-shell -F "#{pane_marked_set}" "send-keys 'M-Right'" "next-window"
bind -n M-Left if-shell -F "#{pane_marked_set}" "send-keys 'M-Left'" 'previous-window'

# Window operations
bind -n M-, if-shell -F "#{pane_marked_set}" "send-keys 'M-,'" "new-window -c '#{pane_current_path}' \; rename-window ''"
bind -n M-r if-shell -F "#{pane_marked_set}" "send-keys 'M-r'" "command-prompt \"rename-window '%%'\""
bind -n M-. if-shell -F "#{pane_marked_set}" "send-keys 'M-.'" 'kill-pane'

# Copy mode 
bind-key    -n              M-:       copy-mode
bind-key    -n              M-@       paste-buffer
bind-key    -T copy-mode    '~'       send-keys -X begin-selection
bind-key    -T copy-mode    v         send-keys -X begin-selection
bind-key    -T copy-mode    Escape    send-keys -X cancel
bind-key    -T copy-mode    Home      send-keys -X start-of-line
bind-key    -T copy-mode    End       send-keys -X end-of-line
bind-key    -T copy-mode    Left      send-keys -X cursor-left
bind-key    -T copy-mode    Right     send-keys -X cursor-right
bind-key    -T copy-mode    Down      send-keys -X cursor-down
bind-key    -T copy-mode    Up        send-keys -X cursor-up
bind-key    -T copy-mode    :         send-keys -X copy-selection-and-cancel
bind-key    -T copy-mode    M-:       send-keys -X copy-selection-and-cancel

# Deprecated
# Select by number
bind -n M-1 if-shell -F "#{pane_marked_set}" "send-keys 'M-1'" "select-window -t 1"
bind -n M-2 if-shell -F "#{pane_marked_set}" "send-keys 'M-2'" "select-window -t 2"
bind -n M-3 if-shell -F "#{pane_marked_set}" "send-keys 'M-3'" "select-window -t 3"
bind -n M-4 if-shell -F "#{pane_marked_set}" "send-keys 'M-4'" "select-window -t 4"
bind -n M-5 if-shell -F "#{pane_marked_set}" "send-keys 'M-5'" "select-window -t 5"
bind -n M-6 if-shell -F "#{pane_marked_set}" "send-keys 'M-6'" "select-window -t 6"
bind -n M-7 if-shell -F "#{pane_marked_set}" "send-keys 'M-7'" "select-window -t 7"
bind -n M-8 if-shell -F "#{pane_marked_set}" "send-keys 'M-8'" "select-window -t 8"
bind -n M-9 if-shell -F "#{pane_marked_set}" "send-keys 'M-9'" "select-window -t 9"
