require("core.keymaps")
require("core.lazy")

-- Set colors
vim.opt.termguicolors = true
vim.cmd("colorscheme catppuccin-mocha")

-- make Nvim transparent
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")

-- make NvimTree transparent
vim.cmd("highlight NvimTreeNormal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE")

