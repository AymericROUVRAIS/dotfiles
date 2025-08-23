return {
  {
    -- Color scheme
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      custom_highlights = function(colors)
        return {
          -- Changing line number
          LineNr = { fg = colors.overlay2 },
        }
      end

    })
  end
  }
}

