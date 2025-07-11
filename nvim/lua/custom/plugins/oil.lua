local oil_window_id

local function toggle_oil()
  if oil_window_id ~= nil then
    vim.api.nvim_win_close(oil_window_id, true)
    oil_window_id = nil
    return nil
  end

  vim.api.nvim_command 'vert topleft 32vs'
  vim.api.nvim_command 'Oil'
  oil_window_id = vim.api.nvim_get_current_win()
end

return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type function|oil.SetupOpts
  opts = function()
    vim.keymap.set('n', '\\', toggle_oil, { desc = 'Open File Explorer' })
    return {}
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
