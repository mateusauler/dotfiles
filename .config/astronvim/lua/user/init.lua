return {
	options = {
		opt = {
			tabstop = 4,
			softtabstop = 4,
			shiftwidth = 4,
			expandtab = false
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
