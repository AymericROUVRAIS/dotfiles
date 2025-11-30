return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,  -- important: load this plugin immediately, not lazily
    priority = 1000, -- high priority to load colorscheme early
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        custom_highlights = function(colors)
          return {
            LineNr = { fg = colors.overlay2 },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
}
