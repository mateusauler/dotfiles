function man --description "Wrapper for the 'man' command"

	if count $argv > /dev/null
		/bin/man $argv[1] | $EDITOR - 
	else
		/bin/man
	end

end
