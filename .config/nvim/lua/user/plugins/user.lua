return {
	"tjdevries/colorbuddy.nvim",
	{
		"ThePrimeagen/vim-be-good",
		lazy = false,
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "/tmp", "~/Downloads", "/", "~/Work" },
			})
		end,
	},
}
