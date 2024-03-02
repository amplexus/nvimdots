return {
	-- Add the community repository of plugin specifications
	"AstroNvim/astrocommunity",
	-- example of imporing a plugin, comment out to use it or add your own
	-- available plugins can be found at https://github.com/AstroNvim/astrocommunity

	-- import a bunch of colourschemes because I will choose which one to use based on the bspwm rice name
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.colorscheme.dracula-nvim" },
	{ import = "astrocommunity.colorscheme.gruvbox-nvim" },
	{ import = "astrocommunity.colorscheme.gruvbox-baby" },
	{ import = "astrocommunity.colorscheme.neosolarized-nvim" },
	{ import = "astrocommunity.colorscheme.tokyonight-nvim" },
	{ import = "astrocommunity.colorscheme.monokai-pro-nvim" },
	{ import = "astrocommunity.colorscheme.nord-nvim" },

	-- Java
	{ import = "astrocommunity.pack.java" },
	{
		"mfussenegger/nvim-jdtls",
		keys = {
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
			{
				"<leader>jG",
				"<cmd>lua require('jdtls.tests').generate()<cr>",
				desc = "Generate Java tests",
			},
			{
				"<leader>js",
				"<cmd>lua require('jdtls.tests').goto_subjects()<cr>",
				desc = "Goto Java class under test",
			},
			{
				"<leader>jp",
				"<cmd>lua require('jdtls').pick_test(true)<cr>",
				desc = "Pick a test to run from the current file",
			},
			{
				"<leader>jb",
				"<cmd>lua require('jdtls').build_projects(true)<cr>",
				desc = "Build the project",
			},
			{
				"<leader>jT",
				"<cmd>lua require('dap.repl').toggle()<cr>",
				desc = "Toggle the DAP state window - e.g. to see junit summary",
			},
		},
	},

	-- Other language packs
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.cpp" },
	{ import = "astrocommunity.pack.cmake" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.typescript" },

	--
	{ import = "astrocommunity.motion.nvim-surround" },    -- https://github.com/kylechui/nvim-surround
	{ import = "astrocommunity.test.neotest" },            -- https://github.com/nvim-neotest/neotest (js: jest and vitest)
	{ import = "astrocommunity.test.nvim-coverage" },      -- https://github.com/andythigpen/nvim-coverage (js: jest only)
	{ import = "astrocommunity.diagnostics.trouble-nvim" }, -- https://github.com/folke/trouble.nvim
	{ import = "astrocommunity.completion.codeium-vim" },
	-- { import = "astrocommunity.completion.copilot-lua-cmp" }, -- no free/trial version anymore
	-- { import = "astrocommunity.completion.tabnine-nvim" }, -- free version only 2-3 words autocomplete
}
