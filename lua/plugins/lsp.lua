require('lze').load {
  {
    "nvim-lspconfig",
    for_cat = "general",
    on_require = { "lspconfig" }
  },
  {
    "lazydev.nvim",
    for_cat = "nixdev",
    cmd = { "LazyDev" },
    ft = "lua",
    after = function(_)
      require('lazydev').setup({
        -- library = {
          -- { words = { "nixCats" }, path = nixCats.nixCatsPath or "") .. '/lua' },
        -- },
      })
    end,
  },
  -- {
    -- "lua_ls",
    -- enabled = nixCats('nixdev'),
    -- -- provide a table containing filetypes,
    -- -- and then whatever your functions defined in the function type specs expect.
    -- -- in our case, it just expects the normal lspconfig setup options,
    -- -- but with a default on_attach and capabilities
    -- lsp = {
      -- -- if you provide the filetypes it doesn't ask lspconfig for the filetypes
      -- filetypes = { 'lua' },
      -- settings = {
        -- Lua = {
          -- runtime = { version = 'LuaJIT' },
          -- formatters = {
            -- ignoreComments = true,
          -- },
          -- signatureHelp = { enabled = true },
          -- diagnostics = {
            -- globals = { "nixCats", "vim", },
            -- disable = { 'missing-fields' },
          -- },
          -- telemetry = { enabled = false },
        -- },
      -- },
    -- },
  -- }
}
