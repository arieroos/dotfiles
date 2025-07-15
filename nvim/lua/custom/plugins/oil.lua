return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type function|oil.SetupOpts
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
