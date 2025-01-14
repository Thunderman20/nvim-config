-- For Tree-sitter: Variables in JavaScript
vim.cmd("highlight @variable.javascript ctermfg=LightBlue guifg=#4EC9B0")
vim.cmd("highlight @lsp.type.variable ctermfg=LightBlue guifg=#ff3c3c")

vim.cmd("highlight clear @variable.parameter")

vim.cmd("highlight @variable.parameter ctermfg=LightBlue guifg=#ffab70")
vim.cmd("highlight @variable.parameter.builtin ctermfg=LightBlue guifg=#ffab70")

-- support.class (Aqua/Teal) -> Use Cyan as Aqua may not be valid
vim.cmd("highlight Type ctermfg=Cyan guifg=#4EC9B0")

-- variable.other (Aqua/Teal) -> Use Cyan as Aqua may not be valid
vim.cmd("highlight Variable ctermfg=Cyan guifg=#4EC9B0")

-- entity.name.type (Aqua/Teal) -> Use Cyan as Aqua may not be valid
vim.cmd("highlight Type ctermfg=Cyan guifg=#4EC9B0")

-- comment (Green)
vim.cmd("highlight Comment ctermfg=Green guifg=#6A9955")

-- string (Green)
vim.cmd("highlight String ctermfg=Green guifg=#00FF00")

-- entity.name.function (Yellow)
vim.cmd("highlight Function ctermfg=Yellow guifg=#ffff00")

-- support.variable (Light Blue)
vim.cmd("highlight Variable ctermfg=LightBlue guifg=#79b8ff")
