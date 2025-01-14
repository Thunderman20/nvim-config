return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		-- Minimal config
		require("themery").setup({
			themes = {
				"rose-pine",
				"tokyonight",
				"catppuccin",
				"github_dark",
				"dracula",
				"gruvbox",
				"onedark",
			}, -- Your list of installed colorschemes.
			livePreview = true, -- Apply theme while picking. Default to true.
		})
	end,
}
