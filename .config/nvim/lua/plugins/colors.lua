return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
        flavour = "mocha",
        integrations = {
                blink_cmp = true,
                native_lsp = {
                    enabled = true,
                },
                treesitter = true,
            }
        }
    },
    {
        'chriskempson/base16-vim'
    }
}
