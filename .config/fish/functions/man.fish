function man --description "Wrapper for the 'man' command"

	if test (count $argv) -eq 1
		/bin/man $argv[1] | $EDITOR -R -
	else
		/bin/man $argv
	end

end
