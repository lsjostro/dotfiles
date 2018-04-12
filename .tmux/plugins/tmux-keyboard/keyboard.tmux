#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

keyboard_interpolation=(
	"\#{keyboard_input}"
)
keyboard_commands=(
	"#($CURRENT_DIR/keyboard.sh)"
)

set_tmux_option() {
	local option="$1"
	local value="$2"
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local all_interpolated="$1"
	for ((i=0; i<${#keyboard_commands[@]}; i++)); do
		all_interpolated=${all_interpolated//${keyboard_interpolation[$i]}/${keyboard_commands[$i]}}
	done
	echo "$all_interpolated"
}

get_tmux_option() {
        local option="$1"
        local default_value="$2"
        local option_value="$(tmux show-option -gqv "$option")"
        if [ -z "$option_value" ]; then
                echo "$default_value"
        else
                echo "$option_value"
        fi
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main