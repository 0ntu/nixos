local km = vim.keymap

vim.g.mapleader = ' '

-- Panel Navigation
km.set('n', '<C-h>', '<C-w>h', { desc = 'Move cursor to left window' })
km.set('n', '<C-j>', '<C-w>j', { desc = 'Move cursor to down window' })
km.set('n', '<C-k>', '<C-w>k', { desc = 'Move cursor to up window' })
km.set('n', '<C-l>', '<C-w>l', { desc = 'Move cursor to right window' })

-- Split
km.set('n', '<Leader>-', '<Cmd>split<CR>', { desc = 'Horizontal Split' })
km.set('n', '<Leader>|', '<Cmd>vert split<CR>', { desc = 'Vertical Split' })

-- Telescope
km.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [k]eymaps' })
km.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [b]uffers' })
km.set('n', '<Tab>', require('telescope.builtin').find_files, { desc = '[S]earch [f]iles' })
km.set('n', '<leader>sF', require('telescope.builtin').git_files, { desc = '[S]earch git [F]iles' })
km.set('n', '<leader>sft', require('telescope.builtin').filetypes, { desc = '[S]earch [f]ile[t]ypes' })
-- km.set('n', '<leader>su', function() require('telescope').extensions.undo.undo() end, { desc = '[S]earch [u]ndo tree' })

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        km.set('n', 'gD', vim.lsp.buf.declaration, opts)
        km.set('n', 'gd', vim.lsp.buf.definition, opts)
        km.set('n', 'K', vim.lsp.buf.hover, opts)
        km.set('n', 'gi', vim.lsp.buf.implementation, opts)
        km.set('n', '<leader>K', vim.lsp.buf.signature_help, opts)
        km.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        km.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        km.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        km.set('n', '<leader>gr', vim.lsp.buf.references, opts)
        km.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)

        km.set('n', '<Leader>d', function() vim.diagnostic.open_float() end, {desc = 'Open [d]iagnostics in a popup window'})
    end,
})
