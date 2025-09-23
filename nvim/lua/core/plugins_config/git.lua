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

      numhl = true, -- Show line number highlights
      linehl = true, -- Show line background highlights
      current_line_blame = true, -- Show git blame inline
      word_diff = false, -- Disable word difference

      -- Keymaps
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set(
          "n", "<leader>gp", 
          gs.preview_hunk, 
          {buffer=bufnr, desc="Preview Git Hunk"}
        )

        vim.keymap.set(
        "n", "<leader>gb",
         gs.toggle_current_lineblame,
         {buffer=bufnr, desc="Toggle Line Blame"}
        )
        
        vim.keymap.set(
          "n", "<leader>gg", 
          gs.toggle_word_diff,
          {buffer=bufnr, desc="Toggle Word Diff"}
        )

      end

    })
  end
},
  
}

