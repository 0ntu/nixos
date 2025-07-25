return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- 'debugloop/telescope-undo.nvim'
    },
    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["C-j"] = "move_selection_next",
                        ["C-k"] = "move_selection_previous",
                    },
                },
            },
        })
    end
}
