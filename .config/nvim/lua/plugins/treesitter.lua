return {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is far too old
    build = ':TSUpdate',
    event = { 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0,
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    -- @type TSConfig
    -- @diagnostic disable-next-line: missing-fields
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "dockerfile",
            "glsl",
            "go",
            "gomod",
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
        }
    },
}
