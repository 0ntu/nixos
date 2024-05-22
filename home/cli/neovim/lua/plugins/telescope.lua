return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- 'debugloop/telescope-undo.nvim'
    },
    config = function()
        require('telescope').setup({
            -- defaults = {
            --     initial_mode = 'normal'
            -- },
            -- extensions = {
            --     undo = {}
            -- },
            mappings = {
            }

        })
        -- require('telescope').load_extension('undo')
    end
}
