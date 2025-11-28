-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set ù as ^ without deadkey
vim.keymap.set('n', 'ù', '^')

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fp', ':Telescope git_files<cr>')
vim.keymap.set('n', '<leader>fz', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fo', ':Telescope oldfiles<cr>')
-- Find files from home directory
vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").find_files({ cwd = vim.fn.expand("~") })
end)

-- NvimTree
vim.keymap.set('n', '<leader>d', ':NvimTreeFindFileToggle<cr>')
vim.keymap.set('n', '<leader>=', ':NvimTreeResize +5<cr>')
vim.keymap.set('n', '<leader>-', ':NvimTreeResize -5<cr>')

-- Markdown preview
vim.keymap.set('n', '<leader>mp', ':MarkdownPreviewToggle<cr>')

-- Nvim-comment
vim.keymap.set({ 'n', 'v' }, '<leader>²', ':CommentToggle<cr>')

-- Bufferlines
vim.keymap.set('n', '<C-Tab>', '<Cmd>BufferLineCycleNext<cr>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-S-Tab>', '<Cmd>BufferLineCyclePrev<cr>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-S-W>', '<Cmd>bdelete<cr>', {noremap = true, silent = true})


-- LaTex setup
vim.keymap.set('n', '<C-s>',
  function()
    require('cmp_vimtex.search').search_menu()
  end)


-- LSP
-- local on_attach = function(client, bufnr)
  -- local opts = { noremap=true, silent=false, buffer=bufnr }

-- Navigation
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references)
-- Documentation
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
-- Refactoring
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- Formatage
vim.keymap.set('n', '<leader>fm', function()
  vim.lsp.buf.format { async = true }
end)


-- Snippets
-- local ls = require("luasnip")
-- 
-- -- Unmap tab
-- ls.config.set_config({
--   history = true,
--   updateevents = "TextChanged,TextChangedI",
-- })
-- 
-- -- Keymaps
-- vim.keymap.set({"i", "s"}, "<C-l>", function()
--   if ls.expand_or_jumpable() then
--     ls.expand_or_jump()
--   end
-- end)
-- 
-- vim.keymap.set({"i", "s"}, "<C-h>", function()
--   if ls.jumpable(-1) then
--     ls.jump(-1)
--   end
-- end)

-- end
