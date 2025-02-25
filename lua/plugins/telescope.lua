-- telescope_setup.lua
return {
	-- Telescope plugin
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Ensure plenary is installed		
		},
		config = function()
			-- Telescope setup without additional configuration
			require("telescope").setup({})
		end,

	},
}
