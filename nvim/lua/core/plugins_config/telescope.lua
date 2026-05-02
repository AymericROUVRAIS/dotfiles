return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        ".git/",
        "build/",
        "dist/",
      },
    },
  },
  -- fuzzyfinder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
}
