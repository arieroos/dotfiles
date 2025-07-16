return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type function|oil.SetupOpts
  opts = {
    columns = { 'icon', 'size', 'mtime' },
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
