-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.opt.encoding = "utf-8"
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- except if cap. in search

-- Remove syntaxe hightlighting (after search)
vim.opt.hlsearch = false

vim.opt.backspace = "2"
vim.opt.autoindent = true
vim.opt.autowrite = true
vim.autoread = true
vim.opt.showcmd = true

-- Minimum of lines/column to keep above and below
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.laststatus = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.wo.relativenumber = true
vim.wo.number = true

