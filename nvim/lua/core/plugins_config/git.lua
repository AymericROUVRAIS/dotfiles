return {
  -- Git integration (lazygit)
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>gs", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>fs", "<cmd>LazyGitLog<cr>", desc = "LazyGitLog" }
      }
  },


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
      word_diff = false,

      -- Keymaps
      on_attach = function(bufnr)
        local gs = require("gitsigns")
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

