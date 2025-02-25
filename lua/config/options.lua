vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.linespace = 2

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.html", "*.css", "*.json", "*.md", "*.rs" },
	callback = function()
		require("conform").format({ async = false }) -- Synchronous formatting before save
	end,
})
