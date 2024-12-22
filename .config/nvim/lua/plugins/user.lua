-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

	-- == Examples of Adding Plugins ==
	"tjdevries/colorbuddy.nvim",
	{
		"ThePrimeagen/vim-be-good",
		lazy = false,
	},

	-- "andweeb/presence.nvim",
	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("lsp_signature").setup()
	-- 	end,
	-- },

	-- == Examples of Overriding Plugins ==

	-- customize alpha options
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				"  █  ░█░░  █   ",
				" ██ O█░░█O ██  ",
				"  █ ██░░██ █   ",
				"  ██░░░░░░██   ",
				"    ░█░░░░     ",
				"  ██░█░░░░██   ",
				"  █ █░█░░█ █   ",
				" ██  █░░█  ██  ",
				"  █        █   ",
			}
			return opts
		end,
	},

	-- You can disable default plugins as follows:
	-- { "max397574/better-escape.nvim", enabled = false },

	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom luasnip configuration such as filetype extend or custom snippets
			local luasnip = require("luasnip")
			luasnip.filetype_extend("javascript", { "javascriptreact" })
		end,
	},

	-- {
	-- 	"barrett-ruth/import-cost.nvim",
	-- 	build = "sh install.sh npm",
	-- 	config = function()
	-- 		require("import-cost").setup()
	-- 	end,
	-- },

	{
		"windwp/nvim-autopairs",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom autopairs configuration such as custom rules
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.add_rules(
				{
					Rule("$", "$", { "tex", "latex" })
						-- don't add a pair if the next character is %
						:with_pair(cond.not_after_regex("%%"))
						-- don't add a pair if  the previous character is xxx
						:with_pair(
							cond.not_before_regex("xxx", 3)
						)
						-- don't move right when repeat character
						:with_move(cond.none())
						-- don't delete if the next character is xx
						:with_del(cond.not_after_regex("xx"))
						-- disable adding a newline when you press <cr>
						:with_cr(cond.none()),
				},
				-- disable for .vim files, but it work for another filetypes
				Rule("a", "a", "-vim")
			)
		end,
	},
	{
		"neotest",
		dependencies = {
			"thenbe/neotest-playwright",
			dependencies = {
				"nvim-telescope/telescope.nvim",
			},
			-- "atm1020/neotest-jdtls",
			"nvim-neotest/neotest-jest",
			"rcasia/neotest-java",
		},
		config = function()
			-- @diagnostic disable-next-line: missing-fields
			require("neotest").setup({
				adapters = {
					require("neotest-playwright").adapter({
						options = {
							persist_project_selection = true,
							enable_dynamic_test_discovery = true,
						},
					}),
					-- require("neotest-jdtls"),
					require("neotest-java"),
					require("neotest-jest"),
				},
			})
		end,
	},
	{
		"dsych/blanket.nvim",
		config = function()
			require("blanket").setup({
				report_path = vim.fn.getcwd() .. "/target/site/jacoco/jacoco.xml",
			})
		end,
		keys = {
			{
				"<leader>jc",
				"<cmd>lua require('blanket').start()<cr>",
				desc = "Process Jacoco Code Coverage Report",
			},
		},
	},
	{
		"yetone/avante.nvim",
		config = function()
			require("avante").setup({
				provider = "gemini",
				gemini = {
					endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
					model = "gemini-2.0-flash-exp",
					timeout = 30000, -- Timeout in milliseconds
					temperature = 0,
					max_tokens = 4096,
				},
				behaviour = {
					support_paste_from_clipboard = true,
				},
			})
		end,
		-- keys = {
		-- 	{
		-- 		"<leader>ac",
		-- 		"<cmd>lua require('avante').generate('gemini')<cr>",
		-- 		desc = "Generate Gemini Code",
		-- 	},
		-- },
	},
}
