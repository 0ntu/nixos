-- Initialize Lazy Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    require('plugins/catppuccin'),
    require('plugins/neodev'),
    require('plugins/lsp'),
    require('plugins/luasnip'),

    -- Time Independent
    require('plugins/rustaceanvim'),
    require('plugins/surround'),
    require('plugins/oil'),
    require('plugins/indent-blankline'),
    require('plugins/comment'),
    require('plugins/sleuth'),
    require('plugins/lualine'),
    require('plugins/autopairs'),
    require('plugins/treesitter'),
    require('plugins/telescope'),
    require('plugins/whichkey'),
    require('plugins/fidget'),
    require('plugins/harpoon'),
    require('plugins/presence'),
}, {})
