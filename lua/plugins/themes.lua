-- lua/plugins/themes.lua
return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		event = "VimEnter", -- Load after startup
		config = function()
			require("rose-pine").setup({
				-- Optional config
				variant = "main", -- "main", "moon", or "dawn"
				dark_variant = "main",
			})
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		event = "VimEnter",
		config = function()
			require("github-theme").setup({
				-- Optional config
				options = { transparent = false },
			})
		end,
	},
}

