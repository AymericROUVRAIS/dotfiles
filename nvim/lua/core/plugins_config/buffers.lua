return{
    -- Save and load buffers (a session) automatically 
    -- for each folder
    {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup ({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads" },
      })
    end
    },

  -- Visualize buffers as tabs
  {
  "akinsho/bufferline.nvim",
  version = "*", 
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- Show buffers as tabs
        numbers = "ordinal", -- Show buffer numbers
        diagnostics = "nvim_lsp", -- Integrate LSP diagnostics
        separator_style = "slant", -- Style for separators (e.g., "slant", "thick", "thin")
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
        color_icons = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true
          }
        }
      }
    })
  end
},

}
