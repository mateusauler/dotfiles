function fish_prompt --description 'Write out the prompt'
    # Save our status
    set -l last_pipestatus $pipestatus

    set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

	set -l color_bg_usr black
	set -l color_fg_pwd '#000'
	set -l color_bg_pwd '#6393ed'
	set -l color_bg_git '#76bf01'
	set -l color_fg_git $color_fg_pwd
	set -l color_bg_vip '#4d4'
	set -l color_fg_vip '#000'

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


	if tty | grep '/dev/tty' > /dev/null
		echo -n -s $curr_mode ' ' $USER ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal)  ' ' $suffix ' '
	else
		echo -n -s (set_color -b $color_bg_vip) (set_color $color_fg_vip) " $curr_mode " \
				   (set_color -b $color_bg_usr) (set_color $color_bg_vip) '' \
				   (set_color normal)

	    echo -n -s (set_color -b $color_bg_usr) " $USER " \
				   (set_color -b $color_bg_pwd) (set_color $color_bg_usr) ' ' \
				   (set_color normal) (set_color -b $color_bg_pwd) (set_color $color_fg_pwd) (prompt_pwd) ' ' \
				   (set_color normal) 

		if test -d .git | git rev-parse --git-dir > /dev/null 2> /dev/null
			echo -n -s (set_color $color_bg_pwd) (set_color -b $color_bg_git) ' ' \
					   (set_color $color_fg_git) ' ' (git branch --show-current) ' ' (set_color normal) \
					   (set_color $color_bg_git) '' (set_color normal)
		else
			echo -n -s (set_color $color_bg_pwd) '' (set_color normal)
		end

		echo -n -s ' '
	end
end
