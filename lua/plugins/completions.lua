return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
    },
    {
        "saadparwaiz1/cmp_luasnip",
    },
    {
        "rafamadriz/friendly-snippets",
   },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require 'cmp'
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                {
                    name = 'nvim_lsp',
                    entry_filter = function(entry, ctx)
                        local kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
                        return kind ~= 'Text'
                    end,
                },
                    { name = 'luasnip' }, -- For luasnip users.
               })
            })

            -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
            -- Set configuration for specific filetype.
            --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]
            --

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    -- { name = 'buffer' }
                    { name = 'nvim_lsp' }, -- LSP-based completions (functions, variables, etc.)
                    { name = 'luasnip' },
                }
            })
        end
    }
}
