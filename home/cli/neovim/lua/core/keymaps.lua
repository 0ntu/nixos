local km = vim.keymap

vim.g.mapleader = ' '

-- Panel Navigation
km.set('n', '<C-h>', '<C-w>h', { desc = 'Move cursor to left window' })
km.set('n', '<C-j>', '<C-w>j', { desc = 'Move cursor to down window' })
km.set('n', '<C-k>', '<C-w>k', { desc = 'Move cursor to up window' })
km.set('n', '<C-l>', '<C-w>l', { desc = 'Move cursor to right window' })

-- Split
km.set('n', '<Leader>-', '<Cmd>split<CR>', { desc = 'Horizontal Split' })
km.set('n', '<Leader>\\', '<Cmd>vert split<CR>', { desc = 'Vertical Split' })

-- Telescope
local telescope = require('telescope.builtin')
km.set('n', '<leader>sk', telescope.keymaps, { desc = '[S]earch [k]eymaps' })
km.set('n', '<leader>sb', telescope.buffers, { desc = '[S]earch [b]uffers' })
km.set({'n', 'v'}, '<leader>sf', telescope.find_files, { desc = '[S]earch [f]iles' })
km.set({'n', 'v'}, '<leader>ss', telescope.grep_string, { desc = '[S]earch [s]tring' })
km.set('n', '<leader>sl', telescope.live_grep, { desc = '[S]earch [l]ive string' })
km.set('n', '<leader>sF', telescope.git_files, { desc = '[S]earch git [F]iles' })
km.set('n', '<leader>sft', telescope.filetypes, { desc = '[S]earch [f]ile[t]ypes' })

-- Harpoon
local harpoon = require('harpoon')
km.set("n", "<leader>a", function() harpoon:list():add() end, { desc = '[A]dd to Harpoon list' })
km.set("n", "<TAB>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon quick menu' })
km.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = 'Harpoon [1]' })
km.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = 'Harpoon [2]' })
km.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = 'Harpoon [3]' })
km.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = 'Harpoon [4]' })
-- km.set("n", "<leader>P", function() harpoon:list():prev() end, { desc = 'Harpoon [p]rev' })
-- km.set("n", "<leader>N", function() harpoon:list():next() end, { desc = 'Harpoon [n]ext' })

-- Oil
km.set("n", "<S-TAB>", function() require("oil").toggle_float() end, { desc = 'Open Oil in a floating window' })

local range_formatting = function()
    local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
    local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
    vim.lsp.buf.format({
        range = {
            ["start"] = { start_row, 0 },
            ["end"] = { end_row, 0 },
        },
        async = true,
    })
end

vim.keymap.set("v", "<leader>f", range_formatting, { desc = "Range Formatting" })

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

        km.set('n', '<Leader>d', function() vim.diagnostic.open_float() end,
            { desc = 'Open [d]iagnostics in a popup window' })
    end,
})
