return {
  -- LSP configuration
  {"neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")

    lspconfig.texlab.setup{
      settings = {
        texlab = {
          diagnostics = {
            ignore = { "latex-underfull-hbox" },
            ignoredPatterns = {
              "You ought to remove spaces in front of punctuation",
              "Command terminated with space",
              ".*Underfull hbox.*"
            }
          },
          build = {
            executable = 'latexmk',
            args = {
              '-pdf', 
              '-interaction=nonstopmode', 
              '-synctex=1',
              '%f'
            },
            onSave = true,
            forwardSearchAfter = true,
          },
          forwardSearch = {
            executable = '',
            args = { '%p' },
          },
          chktex = {
            onOpenAndSave = true,
            onEdit = true
          }
        }
      }
    }
  end
},

  

    -- Autocompletion plugin
    {"hrsh7th/nvim-cmp",
        dependencies = {
          "lervag/vimtex",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer", 
          "hrsh7th/cmp-path", -- Path completion
          "hrsh7th/cmp-cmdline", -- Command completion
          "saadparwaiz1/cmp_luasnip", -- Snippet completion
          "L3MON4D3/LuaSnip",            
          "neovim/nvim-lspconfig",
        },
        config = function()
          local cmp = require("cmp")
          local luasnip = require("luasnip")

          cmp.setup({
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            mapping = {
              ['<Tab>'] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end, { 'i', 's' }),

              ['<S-Tab>'] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                elseif cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end, { 'i', 's' }),
            },
              sources = cmp.config.sources({
                  { name = "nvim_lsp" },
                  { name = "luasnip" },
                  { name = "buffer" },
                  { name = "path" },
              }),
          })
         end,
},

}
