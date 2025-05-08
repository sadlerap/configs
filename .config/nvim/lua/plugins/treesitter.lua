return {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is far too old
    build = ':TSUpdate',
    event = { 'VeryLazy' },
    opts_extend = { "ensure_installed" },
    ---@type nvim-treesitter.configs.TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "dockerfile",
            "glsl",
            "go",
            "gomod",
            "gosum",
            "json",
            "latex",
            "llvm",
            "lua",
            "make",
            "markdown",
            "meson",
            "python",
            "rust",
            "toml",
            "vim",
            "yaml",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
    },
    config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)

        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
}
