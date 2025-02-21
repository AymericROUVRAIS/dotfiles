require("core.keymaps")
require("core.plugins")
require("core.plugins_config")
require("core.plugins_config.autopairs")

-- make Nvim transparent
vim.opt.termguicolors = true
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")

-- make NvimTree transparent
vim.cmd("highlight NvimTreeNormal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE")

