return {
    "hrsh7th/cmp-nvim-lsp",
    opts = {
        sources = {
            { name = 'nvim_lsp' }
        }
    },
    init = function()
        Capabilities = require('cmp_nvim_lsp').default_capabilities()
    end,
}
