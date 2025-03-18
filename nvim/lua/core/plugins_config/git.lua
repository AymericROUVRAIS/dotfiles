return {
  -- Git integration
 
  -- Git signs
  {
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("gitsigns").setup({
      signs = {
add = { text = "+" }, -- Green for added lines
        change = { text = "~" }, -- Yellow for modified lines
        delete = { text = "-" }, -- Red for deleted lines
      },
      numhl = false, -- Disable line number highlights
      linehl = false, -- Disable line background highlights
      current_line_blame = true, -- Show git blame inline
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set(
          "n", "<leader>gp", 
          gs.preview_hunk, 
          { buffer = bufnr, desc = "Preview Git Hunk" })

        vim.keymap.set(
        "n", "<leader>gb", 
        gs.toggle_current_line_blame, 
        { buffer = bufnr, desc = "Toggle Line Blame" })

      end
    })
  end
  },

  
  -- Diff view
  {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { 
    "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" 
    },

  config = function()
    require("diffview").setup({})
  end
  }
}

