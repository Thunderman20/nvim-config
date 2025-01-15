vim.keymap.set("n", "Q", "<nop>")
-- Define the function in a global scope
function Create_new_file()
	local filename = vim.fn.input("Enter file name: ")
	local dir = vim.fn.fnamemodify(filename, ":p:h")

	if dir ~= "" and vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end

	vim.cmd("edit " .. filename)
end

vim.keymap.set("n", "q", ':bd<CR>', { noremap = true, silent = true })
-- Set up the keymap to call the function
vim.api.nvim_set_keymap('n', '<C-n>', ':lua Create_new_file()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<Leader>t", "<Cmd>ToggleTerm<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>l", "<Cmd>LiveServerStart<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>k", "<Cmd>LiveServerStop<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<Leader>q", "<Cmd>qa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>Q", "<Cmd>wqa<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<Cmd>w<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>ct", ":Themery<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<Leader>r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<C-f>", [[:let @/='\<<C-r><C-w>\>'<CR>]])
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set({ "i" }, "<C-c>", "<ESC>", { desc = "switch to normal mode from insert mode" })
-- Copy selected text to the system clipboard
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]], { desc = "Copy to system clipboard" })

-- Cut (delete) selected text to the system clipboard
vim.keymap.set({ "n", "v", "i" }, "<C-x>", [["+d]], { desc = "Cut to system clipboard" })

-- Paste from the system clipboard
vim.keymap.set({ "n", "v", "i" }, "<C-v>", [["+p]], { desc = "Paste from system clipboard" })

-- Paste in insert mode (adjust cursor position for convenience)
vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard in insert mode" })
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format Document" })

-- Undo/Redo mappings for all modes
vim.keymap.set({ "n", "i", "v", "t" }, "<C-u>", "u", { noremap = true, silent = true })     -- Undo one change
vim.keymap.set({ "n", "i", "v", "t" }, "<C-r>", "<C-r>", { noremap = true, silent = true }) -- Redo one change

-- Go to the oldest change (Undo tree start)
vim.keymap.set({ "n", "i", "v", "t" }, "<C-U>", "<Cmd>earlier 9999<CR>", { noremap = true, silent = true })

-- Go to the newest change (Redo tree end)
vim.keymap.set({ "n", "i", "v", "t" }, "<C-R>", "<Cmd>later 9999<CR>", { noremap = true, silent = true })

-- Zoom In (Increase window height)
vim.api.nvim_set_keymap(
	"n",
	"<C-+>",
	":lua vim.opt.winheight = vim.opt.winheight:get() + 1<CR>",
	{ noremap = true, silent = true }
)
--buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })


-- Window navigation in all modes
vim.keymap.set({ "n", "i", "v", "t" }, "<C-Left>", "<Cmd>wincmd h<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v", "t" }, "<C-Down>", "<Cmd>wincmd j<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v", "t" }, "<C-Up>", "<Cmd>wincmd k<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v", "t" }, "<C-Right>", "<Cmd>wincmd l<CR>", { silent = true })

-- Zoom Out (Decrease window height)
vim.api.nvim_set_keymap(
	"n",
	"<C--> ",
	":lua vim.opt.winheight = vim.opt.winheight:get() - 1<CR>",
	{ noremap = true, silent = true }
)
-- Function to set terminal keymaps
function _G.set_terminal_keymaps()
	local opts = { buffer = true }
	-- Exit terminal mode
	vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

	-- Close terminal
	vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], opts)

	-- Toggle vertical terminal
	vim.keymap.set(
		"t",
		"<C-t>",
		[[<C-\><C-n><Cmd>ToggleTerm direction=vertical<CR>]],
		{ noremap = true, silent = true }
	)

	-- Clipboard keymaps in terminal mode
	vim.keymap.set("t", "<C-c>", [[<C-\><C-n>"+y<C-\><C-n>i]], opts) -- Copy to system clipboard
	vim.keymap.set("t", "<C-x>", [[<C-\><C-n>"+d<C-\><C-n>i]], opts) -- Cut to system clipboard
	vim.keymap.set("t", "<C-v>", [[<C-\><C-n>"+p]], opts)           -- Paste from system clipboard
end

-- Automatically set terminal keymaps when entering a terminal
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		set_terminal_keymaps()
	end,
})
