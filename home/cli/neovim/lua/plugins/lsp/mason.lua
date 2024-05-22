local handlers = {
    -- Default Handler
    -- Will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name)
        if (server_name == "rust_analyzer") then return end -- Handle with rustaceanvim
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
            capabilities = vim.lsp.protocol.make_client_capabilities()
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
