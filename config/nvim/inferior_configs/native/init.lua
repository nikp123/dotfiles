local pkg = require("pkg")
pkg.init()
pkg.hook("nvim-treesitter/nvim-treesitter", {
   fetch = function()
      vim.cmd("TSUpdate")
   end,
})
pkg.load()
if pkg.has("nvim-treesitter") then
   require("nvim-treesitter.configs").setup({
      ensure_installed = "",
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
      },
      rainbow = {
         enable = true,
         extended_mode = true,
      }
   })
end

-- meh fucking config m88s
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

vim.cmd ([[
    set nocompatible
]])

--if vim.fn.has("termguicolors") then
--   vim.o.termguicolors = true
--end

vim.o.list = true

-- if vim.fn.exists("utf8") then
--    vim.o.listchars = "tab:❯ ,trail:·"
-- else
--    vim.o.listchars = "tab:> ,trail:."
-- end

vim.o.listchars = "tab:>-,trail:."

vim.cmd([[
   autocmd TermOpen * setlocal nonumber norelativenumber
   autocmd TermOpen * startinsert
]])


-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]

-- NVIM rust-analyzer
--require('rust-tools').setup({})

-- Dependencies
require("syntax_highlighter")
require("language_compiler")
require("language_server")
require("autocomplete")
