return {
	options = {
		opt = {
			tabstop = 4,
			softtabstop = 4,
			shiftwidth = 4,
			expandtab = false,
			guifont = {"FiraCode Nerd Font Mono", ":h10"}
		},
		g = {
			coc_global_extensions = {"coc-flutter"}
		}
	},
	plugins = {
		init = {
			{"neoclide/coc.nvim", branch = "release"}
		}
	}
}
