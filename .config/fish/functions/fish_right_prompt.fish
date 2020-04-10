function fish_right_prompt --description "Fish's right prompt"
	set -l color_bg_usr black
	set -l color_fg_pwd '#000'
	set -l color_bg_pwd '#6393ed'
	set -l color_bg_git '#76bf01'
	set -l color_fg_git $color_fg_pwd

	set -l curr_mode

    switch $fish_bind_mode
        case default
            set curr_mode 'N'
        case insert
            set curr_mode 'I'
        case replace_one
            set curr_mode 'R1'
        case replace
            set curr_mode 'R'
        case visual
            set curr_mode 'V'
    end

#	set curr_mode '[' $curr_mode ']'

	echo -n -s (set_color $color_bg_pwd) ''
	echo -n -s (set_color -b $color_bg_pwd)
	echo -n -s (set_color $color_fg_pwd)
	echo -n -s ' ' $curr_mode ' '
	echo -n -s (set_color normal)
	
end
