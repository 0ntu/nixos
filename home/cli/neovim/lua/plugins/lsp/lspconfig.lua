local server_handlers = function()
    local caps = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities(),
        -- File watching is disabled by default for neovim.
        -- See: https://github.com/neovim/neovim/pull/22405
        -- { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } }
        {}
    );

    local lspconfig = require("lspconfig")
    -- Handled by rustacean.nvim
    -- lspconfig.rust_analyzer.setup({})
    lspconfig.arduino_language_server.setup({
        capabilities = caps,
    })
    lspconfig.matlab_ls.setup({
        capabilities = caps,
    })

    lspconfig.lua_ls.setup({
        capabilities = caps,
    })
    lspconfig.nil_ls.setup({
        capabilities = caps,
        settings = {
            ['nil'] = {
                testSetting = 42,
                formatting = {
                    command = { "alejandra" },
                },
            },
        },
    })
    lspconfig.clangd.setup({
        capabilities = caps,
    })
    lspconfig.basedpyright.setup({
        capabilities = caps,
        settings = {
            basedpyright = {
                analysis = {
                    typeCheckingMode = "off",
                },
            }
        }
    })


    -- don't show parse errors in a separate window
    vim.g.zig_fmt_parse_errors = 0
    -- disable format-on-save from `ziglang/zig.vim`
    vim.g.zig_fmt_autosave = 0

    lspconfig.zls.setup({
        capabilities = caps,
    })
    lspconfig.asm_lsp.setup({
        capabilities = caps,
    })
    lspconfig.bashls.setup({
        capabilities = caps,
    })
    lspconfig.ts_ls.setup({
        capabilities = caps,
    })
end

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = server_handlers
}
