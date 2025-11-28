return{
  
  -- Compilation and PDF preview
  {"lervag/vimtex",
  lazy = false,
  ft = "tex",
  init = function()
    vim.g.vimtex_view_method = "none"
    -- Uncomment to make it open atril on save
    -- vim.g.vimtex_view_method = "general"
    -- vim.g.vimtex_view_general_viewer = "atril"
    -- vim.g.vimtex_view_general_options = "--no-decorations @pdf"

    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      executable = 'latexmk',
      options = {
        '-pdf',
        '-interaction=nonstopmode',
        '-shell-escape'
      }
    }
    vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.vimtex_compiler_autostart = 1
    vim.g.vimtex_view_enabled = 0 
    vim.g.vimtex_view_automatic = 0
    vimtex_view_forward_search_on_start = 0
  end

},



  {"lervag/cmp-vimtex",
    lazy = false,
   dependencies={"lervag/vimtex", "hrsh7th/nvim-cmp"},
   additional_information = {
     info_in_menu = true,
     info_in_window = true,
     info_max_length = 60,
     match_against_info = true,
     origin_in_menu = true,
     symbols_in_menu = true,
     bib_highlighting = true,
     highlight_colors = {
       colon_group = "Normal",
       default_key_group = "PreProc",
       default_value_group = "String",
       important_key_group = "Normal",
       important_value_group = "Identifier",
       },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        sources = cmp.config.sources({
          { name = 'vimtex' },
          { name = 'buffer' },
          { name = 'path' }
        })
      })
    end
    },
   
  },

  -- Snippets for LaTeX
  {"L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },

  -- LaTeX symbols
  {'kdheepak/cmp-latex-symbols',
   lazy = false,
   dependencies = { 'hrsh7th/nvim-cmp' },
   config = function()
     local cmp = require'cmp'
     cmp.setup({
       sources = cmp.config.sources({
         { name = 'latex_symbols' },
         { name = 'buffer' },
         { name = 'path' }
       })
     })
   end
 },

}

