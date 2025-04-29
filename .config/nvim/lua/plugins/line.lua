return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
        init = function()
            vim.g.lualine_status = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                vim.o.statusline = " "
            end
        end,
        opts = function()
            vim.o.laststatus = vim.g.lualine_status
            local opts = {
                options = {
                    theme = 'auto',
                }
            }
            return opts
	end,
    }
}
