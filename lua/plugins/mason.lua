return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			-- Example configuration options
			ui = {
				border = "rounded", -- Set a border style for the UI
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
