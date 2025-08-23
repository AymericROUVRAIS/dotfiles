-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "



-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")

-- NvimTree
vim.keymap.set("n", "<leader>d", ":NvimTreeFindFileToggle<cr>")

-- Format code using LSP
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- Markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

-- Nvim-comment
vim.keymap.set({ "n", "v" }, "<leader>²", ":CommentToggle<cr>")

-- Bufferlines
vim.keymap.set('n', '<C-Tab>', '<Cmd>BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-S-w>', '<Cmd>bdelete<CR>', {noremap = true, silent = true})


-- LaTex setup
vim.keymap.set("n", "<C-s>", 
  function() 
    require('cmp_vimtex.search').search_menu() 
  end)

