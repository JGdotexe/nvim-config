return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.setupopts
  opts = {
    -- Options for how the file listing is displayed
    view_options = {
      -- This will show hidden files (like .gitignore)
      show_hidden = true,
      -- This is how we sort directories first
      sort = {
        -- First, sort by type (directories vs files) in ascending order
        { "type", "asc" },
        -- Then, sort by name in ascending (alphabetical) order
        { "name", "asc" },
      },
    },
  },
  -- optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
