return {
	"tjdevries/colorbuddy.nvim",
	{
		"ThePrimeagen/vim-be-good",
		lazy = false,
	},
	{
		-- Note for this plugin to work you need to :SessionSae once-only in the project foldrer you want it to work in
		"rmagatti/auto-session",
		lazy = false,
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "/tmp", "~/Downloads", "/", "~/Work" },
				auto_session_enabled = true,
				auto_session_enable_last_session = true,
				auto_save_enabled = true,
				auto_restore_enabled = true,
			})
		end,
	},
}
