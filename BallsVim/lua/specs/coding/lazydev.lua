return {
  {
    "lazydev.nvim",
    ft = "lua",
    cmd = { "LazyDev" },
    after = function(_)
      require("lazydev").setup({
        library = {
          { words = { "Snacks" }, path = "snacks.nvim" },
        },
      })
    end,
  }
}
