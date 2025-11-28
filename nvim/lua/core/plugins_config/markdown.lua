return{{
  "iamcco/markdown-preview.nvim",
  build = function()
    -- Install dependencies with npm
    vim.fn["mkdp#util#install"]()
  end,
  ft = { "markdown" }, -- load only for markdown files
  config = function()
    -- Optional settings
    vim.g.mkdp_auto_start = 0       -- don't auto-open preview
    vim.g.mkdp_auto_close = 1       -- close preview when buffer is closed
    vim.g.mkdp_refresh_slow = 0     -- live update
    vim.g.mkdp_browser = ""         -- use default browser
    vim.g.mkdp_theme = "dark"       -- can be "dark" or "light"
  end,
},}

