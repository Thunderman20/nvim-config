return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
			},
			git = {
				enable = false,
			},
		})

		-- Open Nvim Tree automatically when no files are passed to Neovim
		local function open_nvim_tree_on_empty_buffer()
			-- Check if Neovim was started with no arguments
			local is_empty = vim.fn.argc() == 0

			if is_empty then
				-- Open Nvim Tree
				require("nvim-tree.api").tree.open()
			end
		end

		-- Trigger the function on VimEnter
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = open_nvim_tree_on_empty_buffer,
		})
	end,
}

