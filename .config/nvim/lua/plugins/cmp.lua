return {
    'saghen/blink.cmp',
    dependencies = { 'L3MON4D3/LuaSnip' },
    version = '1.*',
    -- @module blink.cmp
    -- @type blink.cmp.Config
    opts = {
        keymap = { preset = 'enter' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            menu = {
                draw = {
                    columns = {
                        { 'label', 'label_description', gap = 1 },
                    },
                }
            },
            documentation = { auto_show = true, auto_show_delay_ms = 100 },
        },
        sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        snippets = { preset = 'luasnip' },
    }
}
