return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "markdown",
      "markdown_inline",
      "latex",
    },
    highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" }, },
    indent = { enable = true },
  },
}
