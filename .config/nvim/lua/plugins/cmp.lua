return {
    'saghen/blink.cmp',
    dependencies = { 'L3MON4D3/LuaSnip' },
    version = '1.*',
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'enter' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            list = {
                selection = { preselect = true, auto_insert = true, },
            },
            menu = {
                auto_show = true,
                border = 'single',
                draw = {
                    treesitter = { 'lsp' },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
                window = { border = 'rounded' },
            },
            ghost_text = {
                enabled = true,
            },
        },
        sources = {
                default = { 'lsp', 'path', 'snippets' },
        },
        snippets = { preset = 'luasnip' },
        signature = { enabled = true },
    }
}
