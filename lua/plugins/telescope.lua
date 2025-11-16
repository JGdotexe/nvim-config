return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
        config = function()
            local builtin = require("telescope.builtin")

            -- ADICIONADO: Atalho para abrir a lista de diagnósticos
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope: Find Diagnostics' })

            -- find files but including hidden
            vim.keymap.set('n', '<leader>ff', function()
                builtin.find_files({
                    -- This command explicitly tells fd to show hidden files and exclude the .git directory
                    find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' }
                })
            end, { desc = 'Telescope: Find Files (explicitly excluding .git)' })

            vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>th', builtin.colorscheme, { desc = 'Telescope: Change Colorscheme' })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-y>"] = function(prompt_bufnr)
                                local actions = require("telescope.actions")
                                local action_state = require("telescope.actions.state")
                                local entry = action_state.get_selected_entry()
                                actions.close(prompt_bufnr)
                                vim.fn.setreg('+', entry.text)
                                vim.notify("Diagnóstico copiado para o clipboard!", vim.log.levels.INFO)
                            end,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
