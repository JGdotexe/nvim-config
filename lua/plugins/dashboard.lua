return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper', --  theme is doom and hyper default is hyper
      disable_move,   --  default is false disable move keymap for hyper
      shortcut_type,   --  shorcut type 'letter' or 'number'
      change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
      config = {},
      hide = {
        statusline,    -- hide statusline default is true
        tabline,       -- hide the tabline
        winbar,        -- hide winbar
      },
      preview = {
        command,       -- preview command
        file_path,     -- preview file path
        file_height,   -- preview file height
        file_width,   -- preview file width
      }
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
