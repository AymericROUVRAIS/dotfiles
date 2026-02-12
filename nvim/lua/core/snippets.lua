local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

-- Define LaTeX snippets with LuaSnip
luasnip.add_snippets("tex", {
  -- begin
  s("beg", {
    t("\\begin{"),
    i(1),
    t("}"),
    t({ "", "  " }),
    i(2),
    t({ "", "\\end{" }),
    rep(1),
    t("}"),
  }),

  -- figures
  s("fig", fmta([[
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.8\textwidth]{<path>}
  \caption{<caption>}
  \label{fig:<label>}
\end{figure}
]], {
    path = i(1),
    caption = i(2),
    label = i(3),
  })),

  -- fractions
  s("frac", {
    t("\\frac{"), i(1, "numerator"), t("}{"), i(2, "denominator"), t("}")
  }),

  -- somme
  s("sum", {
    t("\\sum_{"), i(1, "i="), t("}^{"), i(2, "denominator"), t("}")
  }),

  -- dérivé partiel
  s("fdv", {
    t("\\fdv{"), i(1, ""), t("}{"), i(2, "t"), t("}")
  }),

  -- section
  s("sec", {
    t("\\section{"), i(1, "Section title"), t("}")
  }),

  -- equation
  s("eq", {
    t({ "\\]", "" }),
    i(1),
    t({ "", "\\]" }),
  }),
  -- paragraph
  s("par", {
    t("\\paragraph{"), i(1, "paragraph title"), t("}")
  }),

  -- no indent
  s("noi", {
    t("\\noindent "), i(1)
  }),

  -- equation system
  s("seq", fmta([[
\[
  \left\{
  \begin{array}{r c l}
    <eq1> &= &<r1> \\
    <eq2> &= &<r2> \\
  \end{array}
  \right.
\]
]], {
    eq1 = i(1),
    r1 = i(2),
    eq2 = i(3),
    r2 = i(4)
  })),

  -- Pseudo code
  s("pscode", fmta([[
\begin{algorithm}[H]
\caption{Procédure <nom>}
\begin{algorithmic}
\Procedure{<nom>}{<arg>}
\EndProcedure
\end{algorithmic}
\end{algorithm}
]], {
    nom = i(1),
    arg = i(2),
  })),

  -- titlepage
  s("makedoc", fmta([[
\documentclass[openany]{article}

\usepackage[french]{babel}
\usepackage[a4paper,top=2cm,bottom=2cm,left=3cm,right=3cm,marginparwidth=1.75cm]{geometry}
\setlength{\parskip}{1em}

% Useful packages
\usepackage{amsmath,amsfonts}
\usepackage{subfiles} % use multiple files
\usepackage{graphicx} % image manipulation
\usepackage{subcaption} % subfigure



\begin{document}
\begin{titlepage}
  \centering
  % logos
  \includegraphics{/home/aymeric/Documents/ENSSAT/Enssat-UnivRennes_Noir}

  \vspace{1.5cm}
  \rule{\textwidth}{2pt}
  \vspace{1cm}

  % title
  {\Huge \textbf{<title>} \par}
  \vspace{0.5cm}

  % author
  {\Large Aymeric Rouvrais\\
    professeur: <prof>, \; Informatique
  1\textsuperscript{ière} année \par}

  \vspace{1cm}
  \rule{\textwidth}{2pt}
  \vfill

  % footer
  Année 2025--2026 --- Semestre 2
  \hfill
  {\today}

\end{titlepage}

\end{document}
]], {
    title = i(1),
    prof = i(2),
  })),


  -- subfigures
  s("subfig", fmta([[
\begin{figure}[htbp]
\centering
  \begin{subfigure}[t]{0.45\textwidth}
    \centering
    \includegraphics[width=\linewidth]{<path1>}
    \caption{<sub_caption1>}\label{fig:<sub_label1>}
  \end{subfigure}
  \hfill
  \begin{subfigure}[t]{0.45\textwidth}
    \centering
    \includegraphics[width=\linewidth]{<path2>}
    \caption{<sub_caption2>}\label{fig:<sub_label2>}
  \end{subfigure}
\caption{<caption>}\label{fig:<label>}
\end{figure}
]], {
    path1 = i(1),
    path2 = i(2),
    sub_caption1 = i(3),
    sub_caption2 = i(4),
    caption = i(5),
    sub_label1 = i(6),
    sub_label2 = i(7),
    label = i(8),
  })),


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
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "tex",
--   callback = function()
--     vim.keymap.set("i", "$", "$ $<left>", { buffer = true })
--   end
-- })
