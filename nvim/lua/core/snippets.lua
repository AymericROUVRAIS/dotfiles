local luasnip = require('luasnip')
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local sn = luasnip.snippet_node
local rep = require("luasnip.extras").rep


-- Define LaTeX snippets with LuaSnip
luasnip.add_snippets("tex", {
  -- begin
  s("beg", {
    t("\\begin{"), sn(1,i(1)), t("}"),
    t({ "", "  "}), i(2),
    t({ "", "\\end{"}), rep(1), t("}"),
  }),

  -- figures
  s("beg.fig", {
    t("\\begin{figure}"),
    t("\\centering"),
    t("\\includegraphics{", sn(1,i(1)), t("}")),
    t("\\caption{", sn(1,i(2)), t("}")),
    t("\\label{fig:", sn(1,i(i)), t("}")),
    t({ "", "\\end{figure}"}),
  }),
  
  -- fractions
  s("frac", {
    t("\\frac{"), i(1, "numerator"), t("}{"), i(2, "denominator"), t("}")
  }),

  -- dérivé partiel
  s("fdv", {
    t("\\fdv{"), i(1, ""), t("}{"), i(2, "t"), t("}")
  }),

  -- section
  s("sec", {
    t("\\section{"), i(1, "Section title"), t("}")
  }),
})


-- Load LuaSnip snippets when nvim-cmp is setup
luasnip.config.set_config({
  history = true,
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})



-- Create custom autocompletion
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

-- Autopairs integration with cmp
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- Custom keymap for LaTeX only
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.keymap.set("i", "_", "_{}<left>", { buffer = true })
    -- vim.keymap.set("i", "$", "$ $<left>", { buffer = true })
  end
})
