return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant", -- You can try "thin" or "padded" for different looks
				-- Adjusting the padding of buffer items
				buffer_padding = 20, -- Adjust this to control the height of buffer items
				always_show_bufferline = true,
			},
		})
	end,
}
