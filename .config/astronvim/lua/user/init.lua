-- local rt = require("rust-tools")
--
-- rt.setup({
-- 	server = {
-- 		on_attach = function(_, bufnr)
-- 			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr, desc = "Hover actions" })
-- 			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group,
-- 				{ buffer = bufnr, desc = "Code action groups" })
-- 		end,
-- 	},
-- })

return {
	options = {
		opt = {
			tabstop = 4,
			softtabstop = 4,
			shiftwidth = 4,
			expandtab = false,
			guifont = { "FiraCode Nerd Font Mono", ":h10" }
		},
		g = {
			coc_global_extensions = { "coc-flutter" }
		}
	},
	updater = {
		channel = "stable",
		version = "latest",
		remote = "origin",
		branch = "main",
		commit = nil,
		pin_plugins = nil,
		skip_prompts = false,
		show_changelog = true,
		auto_quit = false,
	},
	-- plugins = {
	-- 	init = {
	-- 		{ "neoclide/coc.nvim",        branch = "release" },
	-- 		{ "dag/vim-fish",             branch = "master" },
	-- 		{ "simrat39/rust-tools.nvim", branch = "master" }
	-- 	}
	-- }
}
