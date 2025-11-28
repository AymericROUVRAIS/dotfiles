return {
  -- Mason - LSP installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason LSP config bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed   = { "texlab", "lua_ls", "pyright" },
        automatic_installation = true,
      })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Use new API: vim.lsp.config and vim.lsp.enable
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Define on_attach once (for shared keybindings)
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'gD',      vim.lsp.buf.declaration,     opts)
        vim.keymap.set('n', 'gd',      vim.lsp.buf.definition,      opts)
        vim.keymap.set('n', 'K',       vim.lsp.buf.hover,           opts)
        -- vim.keymap.set('n', 'gi',      vim.lsp.buf.implementation,  opts)
        vim.keymap.set('n', '<C-k>',   vim.lsp.buf.signature_help,  opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,        opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,   opts)
        vim.keymap.set('n', 'gr',      vim.lsp.buf.references,      opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,  opts)
      end

      -- Setup server configs

      -- texlab (LaTeX)
      vim.lsp.config("texlab", {
        capabilities = capabilities,
        on_attach    = on_attach,
        settings     = {
          texlab = {
            diagnostics = {
              ignore = { "latex-underfull-hbox" },
              ignoredPatterns = {
                "You ought to remove spaces in front of punctuation",
                "Command terminated with space",
                ".*Underfull hbox.*"
              },
            },
            build = {
              executable     = "latexmk",
              args           = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              onSave         = true,
              forwardSearchAfter = false,
            },
            forwardSearch = {
              executable = "",
              args       = { "%p" },
            },
            chktex = {
              onOpenAndSave = true,
              onEdit        = false,
            },
          },
        },
      })
      vim.lsp.enable({ "texlab" })

      -- lua_ls
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach    = on_attach,
        settings     = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace   = {
              library          = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty  = false,
            },
            telemetry = { enable = false },
          },
        },
      })
      vim.lsp.enable({ "lua_ls" })

      -- pyright (Python)
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach    = on_attach,
      })
      vim.lsp.enable({ "pyright" })

      -- Diagnostic display config
      vim.diagnostic.config({
        virtual_text   = true,
        signs          = true,
        underline       = true,
        update_in_insert = false,
        severity_sort   = true,
      })

      -- Diagnostic signs
      local signs = { Error = "✘", Warn = "⚠", Hint = "⚑", Info = "ℹ" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },

  -- Autocompletion plugin
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp    = require("cmp")
      local luasnip = require("luasnip")

      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>']     = cmp.mapping.scroll_docs(-4),
          ['<C-f>']     = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>']     = cmp.mapping.abort(),
          ['<CR>']      = cmp.mapping.confirm({ select = false }),
          ['<Tab>']     = cmp.mapping(function(fallback)
                            if cmp.visible() then
                              cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                              luasnip.expand_or_jump()
                            else
                              fallback()
                            end
                          end, { 'i', 's' }),
          ['<S-Tab>']   = cmp.mapping(function(fallback)
                            if cmp.visible() then
                              cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                              luasnip.jump(-1)
                            else
                              fallback()
                            end
                          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp",     priority = 1000 },
          { name = "luasnip",       priority = 750 },
          { name = "vimtex",        priority = 700 },
          { name = "latex_symbols", priority = 700 },
        }, {
          { name = "buffer",        priority = 500 },
          { name = "path",          priority = 250 },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp       = "[LSP]",
              luasnip        = "[Snip]",
              buffer         = "[Buf]",
              path           = "[Path]",
              vimtex         = "[VTeX]",
              latex_symbols  = "[LaTeX]",
            })[entry.source.name]
            return vim_item
          end
        },
      })
    end,
  },
}

