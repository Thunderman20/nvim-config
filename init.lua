-- require("impatient")
vim.opt.shadafile = "NONE" -- Disable ShaDa completely
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("config.lazy")
require("config.options")
require("config.mappings")
require("config.colors")
