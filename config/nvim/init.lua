
-- Sub-routines {
    local util =   require("util")    -- Random utilities
    local keymap = require("keymap")  -- Key bind utilities
    require("coc")                    -- Language server

    keymap.init()
-- }

-- Options {
    vim.g.mapleader = ","
    vim.o.encoding = "utf-8"
    vim.o.mouse = "a"
    vim.o.hidden = true
    vim.o.tabstop = 4
    vim.o.shiftwidth = 0
    vim.o.expandtab = true
    vim.o.number = true
    vim.o.clipboard = "unnamedplus"
    vim.o.scrolloff = 8
    vim.o.sidescrolloff = 16
    vim.o.ignorecase = true
    vim.o.smartcase = true
    vim.o.smarttab = true
    vim.o.wrap = false
    vim.o.completeopt = "menu,menuone,noselect"
    vim.o.shortmess = vim.o.shortmess .. "c"
    vim.o.ff = "unix"
    vim.o.autoread = true
    vim.o.signcolumn = "yes"
    vim.o.colorcolumn = "81"
    vim.o.exrc = true
    vim.o.secure = true
    vim.o.shell = "/bin/bash"
    vim.o.list = true
    vim.o.listchars = "tab:>-,trail:."

vim.cmd([[
    colorscheme tokyonight
]])

-- auto de-whitespacer
if _G["clean_whitespace"] then
   vim.cmd([[ autocmd BufWritePre <buffer> :call v:lua.clean_whitespace() ]])
end

--vim.cmd([[
--    colorscheme fahrenheit
--]])
-- }

-- Bind Liv's smart_semicolon to desired file formats {
--vim.cmd([[
--    autocmd FileType c          inoremap ; <cmd>:call v:lua.smart_semicolon()<cr>
--    autocmd FileType rust       inoremap ; <cmd>:call v:lua.smart_semicolon()<cr>
--    autocmd FileType cpp        inoremap ; <cmd>:call v:lua.smart_semicolon()<cr>
--    autocmd FileType java       inoremap ; <cmd>:call v:lua.smart_semicolon()<cr>
--    autocmd FileType javascript inoremap ; <cmd>:call v:lua.smart_semicolon()<cr>
--]])
-- }


-- Packages {
    return require('packer').startup(function()
        use 'wbthomason/packer.nvim'
        use {'neoclide/coc.nvim', branch = 'release'}
        use 'folke/tokyonight.nvim'
        use 'fcpg/vim-fahrenheit'
        use 'nvim-treesitter/nvim-treesitter'
        use 'jackguo380/vim-lsp-cxx-highlight'
        use { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install' }
    end)
-- }
