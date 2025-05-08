return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp', 'nvim-tree/nvim-web-devicons' },
        opts = function()
            ---@class PluginLspOpts
            local ret = {
                ---@type vim.diagnostic.Opts
                diagnostics = {
                    severity_sort = true,
                    underline = true,
                    update_in_insert = false,
                    virtual_lines = true,
                    virtual_text = {
                        spacing = 4,
                        source = 'if_many',
                    },
                    signs = {
                        text = {
                            [vim.diagnostic.severity.ERROR] = " ",
                            [vim.diagnostic.severity.WARN]  = " ",
                            [vim.diagnostic.severity.HINT]  = " ",
                            [vim.diagnostic.severity.INFO]  = " ",
                        },
                    },
                },
                inlay_hints = {
                    enabled = true,
                },
                codelens = {
                    enabled = false,
                },
                ---@type lsp.ClientCapabilities
                capabilities = {
                    workspace = {
                        fileOperations = {
                            didRename = true,
                            willRename = true,
                        },
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                },
                servers = {
                    lua_ls = {
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                    library = vim.api.nvim_get_runtime_file("", true)
                                },
                            }
                        }
                    },
                    rust_analyzer = {
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true,
                        },
                        rustc = {
                            source = "discover",
                        },
                        editor = {
                            formatOnSave = true,
                        }
                    },
                    gopls = {},
                },
            }
            return ret
        end,
        ---@param opts PluginLspOpts
        config = function(_, opts)
            local servers = opts.servers
            local has_blink, blink = pcall(require, 'blink.cmp')
            local capabilities = vim.tbl_deep_extend(
                'force',
                {},
                vim.lsp.protocol.make_client_capabilities(),
                has_blink and blink.get_lsp_capabilities() or {},
                opts.capabilities or {}
            )
            vim.lsp.inlay_hint.enable(opts.inlay_hints.enabled)
            vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
            local function setup_server(server)
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                    on_attach = require('plugins.lsp.keys').on_attach or function(...) end
                }, servers[server] or {})
                if server_opts.enabled == false then
                    return
                end
                require("lspconfig")[server].setup(server_opts)
            end

            for server, server_opts in pairs(servers) do
                if server_opts then
                    server_opts = server_opts == true and {} or server_opts
                    if server_opts.enabled ~= false then
                        setup_server(server)
                    end
                end
            end

            vim.api.nvim_create_autocmd({'ColorScheme'}, {
                callback = function ()
                    vim.api.nvim_set_hl(0, '@lsp.mod.deprecated',         { strikethrough = true })
                    vim.api.nvim_set_hl(0, '@lsp.typemod.function.async', { fg = 'Blue' })
                    vim.api.nvim_set_hl(0, '@lsp.type.typeParameter',     { fg = 'Purple' })
                end
            })
        end
    }
}
