return {
    -- The new default theme, Lackluster
    {
        "slugbyte/lackluster.nvim",
        lazy = false, -- Make sure the theme is loaded on startup
        priority = 1000, -- Make sure it has priority over other plugins
        config = function()
            -- Set Lackluster as the default colorscheme
            vim.cmd.colorscheme('lackluster')
        end,
    },

    -- Your other theme, Kanagawa
    {
        "rebelot/kanagawa.nvim",
        lazy = false, -- Also load this on startup so it's available in the picker
    },
}
