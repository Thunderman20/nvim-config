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

vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })


vim.keymap.set('n', '<C-n>', Create_new_file, { noremap = true, silent = true })


vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-c>", "<Cmd>bd<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>l", "<Cmd>LiveServerStart<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>k", "<Cmd>LiveServerStop<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "q", "<Cmd>wq<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<Leader>q", "<Cmd>wqa<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<Leader>Q", "<Cmd>qa!<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<Cmd>w<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<C-S>", "<Cmd>wa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>ct", ":Themery<CR>", { noremap = true, silent = true })


vim.keymap.set("n", "<Leader>r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
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
vim.keymap.set({ "n", "i", "v" }, "<C-u>", "u", { noremap = true, silent = true })     -- Undo one change
vim.keymap.set({ "n", "i", "v" }, "<C-r>", "<C-r>", { noremap = true, silent = true }) -- Redo one change

-- Go to the oldest change (Undo tree start)
vim.keymap.set({ "n", "i", "v" }, "<C-U>", "<Cmd>earlier 9999<CR>", { noremap = true, silent = true })

-- Go to the newest change (Redo tree end)
vim.keymap.set({ "n", "i", "v" }, "<C-R>", "<Cmd>later 9999<CR>", { noremap = true, silent = true })

--buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })


-- Window navigation in all modes
vim.keymap.set({ "n", "i", "v" }, "<C-Left>", "<Cmd>wincmd h<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-Down>", "<Cmd>wincmd j<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-Up>", "<Cmd>wincmd k<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-Right>", "<Cmd>wincmd l<CR>", { silent = true })


vim.keymap.set("n", "<C-f>", [[:let @/ = '\<<C-r><C-w>\>'<CR>:set hlsearch<CR>:%s//<C-r><C-w>/g<Left><Left><Left>]])

vim.keymap.set("n", "<C-d>", ":nohlsearch<CR>", { noremap = true, silent = true })
