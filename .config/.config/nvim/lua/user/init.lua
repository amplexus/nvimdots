local themeFile = os.getenv("HOME") .. "/.config/bspwm/.rice"
local f = io.open(themeFile, "r")

local nvim_theme
local rice

if f ~= nil then
	rice = f:read("*all")
	f:close()
end

-- Choose a neovim theme that approximately matches the current rice
if rice == "kahzia" then
	nvim_theme = "catppuccin"
elseif rice == "gruvbox" then
	nvim_theme = "gruvbox-baby"
elseif rice == "gruvmat" then
	nvim_theme = "gruvbox-baby"
elseif rice == "dracula" then
	nvim_theme = "dracula"
elseif rice == "solarized" then
	nvim_theme = "neosolarized"
elseif rice == "aline" then
	nvim_theme = "nord"
elseif rice == "andrea" then
	nvim_theme = "nord"
elseif rice == "ayu" then
	nvim_theme = "monokai-pro"
elseif rice == "cristina" then
	nvim_theme = "nord"
elseif rice == "cynthia" then
	nvim_theme = "tokyonight"
elseif rice == "doombox" then
	nvim_theme = "gruvbox-baby"
elseif rice == "dune" then
	nvim_theme = "desert"
elseif rice == "emilia" then
	nvim_theme = "neosolarized"
elseif rice == "isabel" then
	nvim_theme = "catppuccin-mocha"
elseif rice == "jan" then
	nvim_theme = "tokyonight"
elseif rice == "karla" then
	nvim_theme = "habamax"
elseif rice == "melissa" then
	nvim_theme = "nord"
elseif rice == "pamela" then
	nvim_theme = "catppuccin"
elseif rice == "silvia" then
	nvim_theme = "gruvbox-baby"
elseif rice == "z0mbi3" then
	nvim_theme = "catppuccin"
else
	nvim_theme = "catppuccin"
end

return {
	-- Configure AstroNvim updates
	updater = {
		remote = "origin",   -- remote to use
		channel = "stable",  -- "stable" or "nightly"
		version = "latest",  -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "nightly",  -- branch name (NIGHTLY ONLY)
		commit = nil,        -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil,   -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_quit = false,   -- automatically quit the current session after a successful update
		remotes = {          -- easily add new remotes to track
			--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
			--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
			--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		},
	},

	-- Set colorscheme to use
	colorscheme = nvim_theme,
	--colorscheme = "dracula",
	--colorscheme = "nord-nvim",
	--colorscheme = "gruvbox",
	--colorscheme = "gruvbox-baby",
	--colorscheme = "tokyonight",
	--colorscheme = "monokai-pro",

	-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	lsp = {
		-- customize lsp formatting options
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					"java",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- disable lua_ls formatting capability if you want to use StyLua to format your lua code
				-- "lua_ls",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
		["bashls"] = {
			settings = {
				bashIde = {
					globPattern = "*@(.sh|.inc|.bash|.command)",
				},
			},
		},
	},

	-- Configure require("lazy").setup() options
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
			},
		},
	},

	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		local group = vim.api.nvim_create_augroup("__env", { clear = true })
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = ".env*",
			group = group,
			callback = function(args)
				vim.diagnostic.disable(args.buf)
			end,
		})
		-- autocmd BufNewFile,BufRead modules.json setlocal filetype=jsonc
		-- vim.api.nvim_create_autocmd("BufEnter", {
		-- 	pattern = "modules.json",
		-- 	group = group,
		-- 	callback = function(args)
		-- 		filetype = jsonc
		-- 	end,
		-- })
	end,
}
