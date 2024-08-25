local server_handlers = function()
    local lspconfig = require("lspconfig")
    -- Handled by rustacean.nvim
    -- lspconfig.rust_analyzer.setup({})

    lspconfig.lua_ls.setup({})
    lspconfig.nil_ls.setup({})
    lspconfig.clangd.setup({})
    lspconfig.basedpyright.setup({})
end

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = server_handlers
}
