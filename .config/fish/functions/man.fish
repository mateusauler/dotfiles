function man --description "Wrapper for the 'man' command"

	vim -c ":Man $argv " -c ":wincmd j" -c ":q"

end
