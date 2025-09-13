return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {'lua', 'python', 'c', 'java'},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}

