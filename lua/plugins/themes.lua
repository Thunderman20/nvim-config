return {
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		config = function()
			require("github-theme").setup({
				specs = {
					all = {
						bg1 = "#000000", -- Black background
						bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
						bg3 = "#121820", -- 55% darkened from stock
						sel0 = "#131b24", -- 55% darkened from stock
					},
				},
			})
		end,
	},
	{ "Mofiqul/dracula.nvim", name = "dracula" },
	{ "ellisonleao/gruvbox.nvim", name = "gruvbox" },
	{ "navarasu/onedark.nvim", name = "onedark" },
}
