return {
  {
    "nvim-lspconfig",
    for_cat = "core.default",
    on_require = { "lspconfig" },
    lsp = function(plugin)
      print("Loading LSP: " .. plugin.name)
      require('lspconfig')[plugin.name].setup(vim.tbl_extend("force",{
        capabilities = require('plugins.lsp.utils').get_capabilities(plugin.name),
        on_attach = require('plugins.lsp.utils').on_attach,
      }, plugin.lsp or {}))
    end,
  },
  {
    "lua_ls",
    for_cat = "code.lua",
    lsp = {
      filetypes = { 'lua' },
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          codeLens = {
            enable = true,
          },
          completion = {
            callSnippet = "Replace",
          },
          doc = {
            privateName = { "^_" },
          },
          hint = {
            enable = true,
            setType = false,
            paramType = true,
            paramName = "Disable",
            semicolon = "Disable",
            arrayIndex = "Disable",
          },
        },
      },
    },
  },
  {
    "lazydev.nvim",
    for_cat = "code.lua",
    ft = "lua",
    cmd = { "LazyDev" },
    after = function(_)
      require('lazydev').setup({
        library = {
          { words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. '/lua' },
        },
      })
    end,
  },
  {
    "nixd",
    for_cat = "code.nix",
    lsp = {
      filetypes = { "nix" },
      settings = {
        nixd = {
          nixpkgs = {
            expr = nixCats.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]],
          },
          options = {
            nixos = {
              expr = nixCats.extra("nixdExtras.nixos_options")
            },
          },
        },
        formatting = {
          command = { "nixfmt" },
        },
        diagnostic = {
          suppress = {
            "sema-escaping-with"
          },
        },
      },
    },
  },
}
