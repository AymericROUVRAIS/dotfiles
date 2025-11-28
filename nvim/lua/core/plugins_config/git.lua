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
      word_diff = true,

      -- Keymaps
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        vim.keymap.set(
          "n", "<leader>gp", 
          gs.preview_hunk, 
          {buffer=bufnr, desc="Preview Git Hunk"}
        )

        vim.keymap.set(
        "n", "<leader>gb",
         gs.toggle_current_line_blame,
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

