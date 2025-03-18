vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- yank to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [['+y]])

vim.opt.encoding = 'utf-8'
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- except if cap. in search

vim.opt.hlsearch = false

vim.opt.backspace = '2'
vim.opt.autoindent = true
vim.opt.autowrite = true
vim.autoread = true
vim.opt.showcmd = true

--minimum of lines/column to keep above and below
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.laststatus = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.wo.relativenumber = true
vim.wo.number = true


-- Telescope
vim.keymap.set("n", "<leader>f", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")

-- Tree
vim.keymap.set("n", "<leader>d", ":NvimTreeFindFileToggle<cr>")

-- Format code using LSP
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- Markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

-- Nvim-comment
vim.keymap.set({ "n", "v" }, "<leader>²", ":CommentToggle<cr>")
