return {
  {
    "ts-comments.nvim",
    event = "DeferredUIEnter",
    after = function (_)
      require("ts-comments").setup()
    end,
  },
}
