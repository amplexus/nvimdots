-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.completion.avante-nvim" },
	{ import = "astrocommunity.test.neotest" },
	{ import = "astrocommunity.test.nvim-coverage" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.colorscheme.dracula-nvim" },
	{ import = "astrocommunity.colorscheme.gruvbox-nvim" },
	{ import = "astrocommunity.colorscheme.gruvbox-baby" },
	{ import = "astrocommunity.colorscheme.neosolarized-nvim" },
	{ import = "astrocommunity.colorscheme.tokyonight-nvim" },
	{ import = "astrocommunity.colorscheme.monokai-pro-nvim" },
	{ import = "astrocommunity.colorscheme.nord-nvim" },
	{
		import = "astrocommunity.pack.java",
	},
	{
		"mfussenegger/nvim-jdtls",
		keys = {
			{
				"<leader>j",
				desc = "JDTLS",
			},
			{
				"<leader>jt",
				"<cmd>lua require('jdtls').test_class()<cr>",
				desc = "Java Test Class",
			},
			{
				"<leader>jn",
				"<cmd>lua require('jdtls').test_nearest_method()<cr>",
				desc = "Java Test Nearest Method",
			},
			{
				"<leader>jw",
				"<cmd>JdtWipeDataAndRestart<cr>",
				desc = "Java Wipe Workspace And Restart JDTLS",
			},
		},
	},
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.php" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.cpp" },
	{ import = "astrocommunity.pack.cmake" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.motion.nvim-surround" }, -- https://github.com/kylechui/nvim-surround
	{ import = "astrocommunity.test.neotest" }, -- https://github.com/nvim-neotest/neotest (js: jest and vitest)
	{ import = "astrocommunity.test.nvim-coverage" }, -- https://github.com/andythigpen/nvim-coverage (js: jest only)
	{ import = "astrocommunity.diagnostics.trouble-nvim" }, -- https://github.com/folke/trouble.nvim
	-- { import = "astrocommunity.completion.codeium-vim" }, -- HOME ONLY
	{ import = "astrocommunity.completion.copilot-lua-cmp" }, -- WORK ONLY
	{ import = "astrocommunity.editing-support.copilotchat-nvim" }, -- WORK ONLY
}
