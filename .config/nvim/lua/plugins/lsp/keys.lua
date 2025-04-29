local M = {}

function M.on_attach(_, bufnr)
    local function set_keymap(...)
        vim.keymap.set(...)
    end
    local function buf_set_option(key, value) vim.api.nvim_set_option_value(key, value, { buf = bufnr }) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true, buffer = bufnr }

    set_keymap('n',        'gD',         function () vim.lsp.buf.declaration() end, opts)
    set_keymap('n',        'gd',         function () vim.lsp.buf.definition() end, opts)
    set_keymap('n',        'K',          function () vim.lsp.buf.hover() end, opts)
    set_keymap('n',        'gi',         function () vim.lsp.buf.implementation() end, opts)
    set_keymap('n',        '<C-k>',      function () vim.lsp.buf.signature_help() end, opts)
    set_keymap('n',        '<space>wa',  function () vim.lsp.buf.add_workspace_folder() end, opts)
    set_keymap('n',        '<space>wr',  function () vim.lsp.buf.remove_workspace_folder() end, opts)
    set_keymap('n',        '<space>wl',  function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    set_keymap('n',        '<space>t',   function() vim.lsp.buf.type_definition() end, opts)
    set_keymap('n',        '<space>rn',  function() vim.lsp.buf.rename() end, opts)
    set_keymap({'n', 'v'}, '<space>ca',  function() vim.lsp.buf.code_action() end, opts)
    set_keymap({'n', 'v'}, '<space>cc',  function() vim.lsp.codelens.run() end, opts)
    set_keymap({'n', 'v'}, '<space>cC',  function() vim.lsp.codelens.refresh() end, opts)
    -- set_keymap('n',        '<space>cl',  function() vim.lsp.codelens.display() end, opts)
    set_keymap('n',        'gr',         function() vim.lsp.buf.references() end, opts)
    set_keymap('n',        '<space>e',   function() vim.lsp.diagnostic.show_line_diagnostics() end, opts)
    set_keymap('n',        '[d',         function() vim.lsp.diagnostic.goto_prev() end, opts)
    set_keymap('n',        ']d',         function() vim.lsp.diagnostic.goto_next() end, opts)
    set_keymap('n',        '<space>q',   function() vim.lsp.diagnostic.set_loclist() end, opts)
    set_keymap({'n', 'v'}, '<space>gq',  function() vim.lsp.buf.format() end, opts)

    -- -- debugging keybindings
    set_keymap('n', '<space>b',   "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
    set_keymap('n', '<space>dc',  "<cmd>lua require'dap'.clear_breakpoints()<CR>", opts)
    set_keymap('n', '<space>ds',  "<cmd>lua require'dap'.terminate()<CR>", opts)
    set_keymap('n', '<F5>',       "<cmd>lua require'dap'.continue()<CR>", opts)
    set_keymap('n', '<F10>',      "<cmd>lua require'dap'.step_over()<CR>", opts)
    set_keymap('n', '<F11>',      "<cmd>lua require'dap'.step_into()<CR>", opts)
    set_keymap('n', '<F12>',      "<cmd>lua require'dap'.step_out()<CR>", opts)
end

return M
