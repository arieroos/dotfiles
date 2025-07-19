return {
  'nvim-flutter/flutter-tools.nvim',
  enabled = false,
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {}
  end,
}
