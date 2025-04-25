return {
  {
    "mini.ai",
    event = "DeferredUIEnter",
    after = function (_)
      -- TODO: look at the LazyVim config for this and update
      require("mini.ai").setup()
    end
  }
}
