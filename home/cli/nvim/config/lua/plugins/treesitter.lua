return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            auto_install = false,
            ensure_installed = {},
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
