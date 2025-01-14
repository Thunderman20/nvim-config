vim.g.mapleader = " "
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("config.lazy")
require("nvim-treesitter.install").compilers = { "zig" }
require("config.treesitter")
require("config.options")
require("config.mappings")
require("config.colors")
