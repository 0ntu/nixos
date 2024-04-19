local handlers = {
    -- Default Handler
    -- Will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name)
        require('lspconfig')[server_name].setup({})
    end,

    ["lua_ls"] = function()
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    }
                }
            },
            capabilities = Capabilities
        })
    end,

    -- Handle with rustaceanvim
    ["rust_analyzer"] = function()

    end,

    ["pyright"] = function()
        require('lspconfig').pyright.setup({
            settings = {
                pyright = {
                    typeCheckingMode = 'off'
                }
            }
        })
    end,
}

return {
    {
        'williamboman/mason.nvim',
        opts = {},
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            handlers = handlers,
        },
    },
}

