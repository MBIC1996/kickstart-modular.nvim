-- LSP Plugins
return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- ... (all your LspAttach, diagnostics, etc. code stays unchanged above) ...

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      ---------------------------------------------------------------------------
      -- Language servers configuration
      ---------------------------------------------------------------------------
      local servers = {
        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              diagnostics = { enable = true },
            },
          },
        },

        -- Python (basedpyright)
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
              },
            },
          },
        },

        -- VHDL (rust_hdl / vhdl_ls)
        vhdl_ls = {
          settings = {
            vhdl_ls = {
              lsp = {
                enableDiagnostics = true,
                enableCompletion = true,
              },
            },
          },
        },

        -- TOML (taplo)
        taplo = {
          settings = {
            taplo = {
              diagnostics = { enabled = true },
              completion = { enabled = true },
            },
          },
        },
      }

      -- Make sure Mason installs everything
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
        'ruff',
        'prettier',
        'vhdl-style-guide', -- formatter (not an LSP)
      })

      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
      }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- leave empty because we're managing via mason-tool-installer
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
