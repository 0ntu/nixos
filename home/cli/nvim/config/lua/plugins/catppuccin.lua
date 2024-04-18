-- Catppuccin colorscheme
return {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha",
        integrations = {
            cmp = true,
            treesitter = true,
            fidget = true,
            markdown = true,
            which_key = true,
        }
    },
}
