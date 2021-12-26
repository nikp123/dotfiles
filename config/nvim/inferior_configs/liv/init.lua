vim.g.kommentary_create_default_mappings = false
vim.o.shell = "/bin/bash"

local pkg = require("pkg")
pkg.init()
pkg.hook("nvim-treesitter/nvim-treesitter", {
   fetch = function()
      vim.cmd("TSUpdate")
   end,
})
pkg.load()

local util = require("util")
local lsp = require("lsp")
local keymap = require("keymap")

lsp.init()
lsp.use_icons()

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

keymap.init()
keymap.map("n", "j", "gj")
keymap.map("n", "k", "gk")
keymap.map("n", "Q", "<nop>")

vim.g.mapleader = util.termcodes"<space>"
local spc = keymap.spc
local buf_spc = keymap.buf_spc

local function wk_update()
   if pkg.has("which-key.nvim") then
      require("which-key").register(keymap.doc, { prefix = "<leader>" })
   end
end

wk_update()

spc("q", "<cmd>quitall<cr>", "Quit")
spc("Q", "<cmd>quitall!<cr>", "Force quit")
spc("s", "<cmd>update<cr>", "Save")
spc("d", "<C-d>", "Go down", "nv")
spc("u", "<C-u>", "Go up", "nv")
spc("T", "<cmd>terminal<cr>", "Terminal")

keymap.spc_group("b", "+Buffer")
spc("bn", "<cmd>bnext<cr>", "Next")
spc("bp", "<cmd>bprevious<cr>", "Prev")
spc("bd", "<cmd>bdelete<cr>", "Delete")
spc("bD", "<cmd>bdelete!<cr>", "Force delete")
spc("bl", "<cmd>ls<cr>", "List")
spc("br", "<cmd>edit<cr>", "Reload")
spc("bR", "<cmd>edit!<cr>", "Force reload")

keymap.spc_group("f", "+File")
spc("fv", "<cmd>edit $MYVIMRC<cr>", "Vimrc")

keymap.spc_group("t", "+Toggles")
spc("th", "<cmd>lua vim.o.hlsearch = not vim.o.hlsearch<cr>", "Highlight")

keymap.spc_group("w", "+Window")
spc("wh", "<C-w>h", "Go left")
spc("wj", "<C-w>j", "Go down")
spc("wk", "<C-w>k", "Go up")
spc("wl", "<C-w>l", "Go right")
spc("wH", "<C-w>H", "Move left")
spc("wJ", "<C-w>J", "Move down")
spc("wK", "<C-w>K", "Move up")
spc("wL", "<C-w>L", "Move right")
spc("ws", "<C-w>s", "Hsplit")
spc("wv", "<C-w>v", "Vsplit")
spc("wo", "<C-w>o", "Only")
spc("wd", "<cmd>quit<cr>", "Delete")
spc("ww", "<C-w>w", "Go next")
spc("w=", "<C-w>=", "Same size")

keymap.spc_group("h", "+History")
keymap.spc_group("p", "+Project")

lsp.on_attach(function(_, bufnr)
   keymap.spc_group("l", "+LSP")
   buf_spc(bufnr, "la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions")
   buf_spc(bufnr, "ld", "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition")
   buf_spc(bufnr, "li", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation")
   buf_spc(bufnr, "lh", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover")
   buf_spc(bufnr, "lr", "<cmd>lua vim.lsp.buf.references()<cr>", "References")
   vim.cmd("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false})")
   wk_update()
end)

if pkg.has("which-key.nvim") then
   vim.o.timeoutlen = 30
end

if pkg.has("nvim-autopairs") then
   require('nvim-autopairs').setup()
end

if pkg.has("completion-nvim") then
   --vim.g.completion_trigger_on_delete = 1
   --vim.g.completion_trigger_keyword_length = 2

   vim.cmd([[
   augroup CompletionTriggerCharacter
       autocmd!
       autocmd BufEnter * let g:completion_trigger_character = ['.']
       autocmd BufEnter *.c,*.cpp,*.rs let g:completion_trigger_character = ['.', '::']
   augroup end
   ]])

   if pkg.has("vim-vsnip") then
      vim.g.completion_enable_snippet = "vim-vsnip"
   end

   if pkg.has("nvim-autopairs") then
      function _G.handle_cr()
         if vim.fn.pumvisible() == 1
               and vim.fn.complete_info()["selected"] ~= -1 then
            require("completion").confirmCompletion()
            return require("nvim-autopairs").esc("<C-y>")
         else
            return require("nvim-autopairs").autopairs_cr()
         end
      end

      local opts = { expr = true, noremap = true }
      keymap.map("i", "<cr>", "v:lua.handle_cr()", opts)
   end
end

if pkg.has("gitsigns.nvim") then
   require("gitsigns").setup()
end

if pkg.has("telescope.nvim") then
   local telescope = require("telescope")
   local config = {}

   if vim.fn.has("utf8") then
      config.prompt_prefix = "❯ "
      config.selection_caret = "➤ "
   end

   telescope.setup({ defaults = config })

   local function ts(f)
      return "<cmd>lua require('telescope.builtin')." .. f .. "()<cr>"
   end

   -- Haha undocumented dependency go brrr
   if vim.fn.executable("rg") == 1 then
      spc("fs", ts"live_grep", "Search")
   end

   spc("fb", ts"file_browser", "Browse")
   spc("ff", ts"find_files", "Find")

   lsp.on_attach(function(_, bufnr)
      buf_spc(bufnr, "la", ts"lsp_code_actions", "Actions")
      buf_spc(bufnr, "le", ts"lsp_workspace_diagnostics", "Diagnostics")
      buf_spc(bufnr, "lr", ts"lsp_references", "References")
      buf_spc(bufnr, "ls", ts"lsp_document_symbols", "Symbols")
      wk_update()
   end)

   spc("ha", ts"git_commits", "All")
   spc("hb", ts"git_bcommits", "Buffer")
   spc("ht", ts"git_branches", "Branches")
end

if pkg.has("kommentary") then
   spc("/", "<Plug>kommentary_line_default", "Comment", "nv", { silent = true })
end

if pkg.has("Navigator.nvim") then
   keymap.map("nt", "<C-h>", "<cmd>lua require('Navigator').left()<cr>")
   keymap.map("nt", "<C-j>", "<cmd>lua require('Navigator').down()<cr>")
   keymap.map("nt", "<C-k>", "<cmd>lua require('Navigator').up()<cr>")
   keymap.map("nt", "<C-l>", "<cmd>lua require('Navigator').right()<cr>")
else
   keymap.map("nt", "<C-h>", "<C-w>h")
   keymap.map("nt", "<C-j>", "<C-w>j")
   keymap.map("nt", "<C-k>", "<C-w>k")
   keymap.map("nt", "<C-l>", "<C-w>l")
end

if pkg.has("FTerm.nvim") then
   require("FTerm").setup({
      dimensions  = {
         height = 0.8,
         width = 0.8,
         x = 0.5,
         y = 0.5,
      },
      border = "single",
   })

   spc("tt", "<cmd>lua require('FTerm').toggle()<cr>", "Terminal")
   keymap.map("nt", "<A-t>", "<cmd>lua require('FTerm').toggle()<cr>")
end

if pkg.has("zen-mode.nvim") then
   require("zen-mode").setup({
      window = {
         width = 90,
      }
   })

   spc("tz", "<cmd>lua require('zen-mode').toggle()<cr>", "Zen mode")
end

if pkg.has("twilight.nvim") then
   require("twilight").setup()
   spc("td", "<cmd>Twilight<cr>", "Dimming")
end

vim.o.mouse = "a"
vim.o.hidden = true
vim.o.tabstop = 3
vim.o.shiftwidth = 0
vim.o.expandtab = true
vim.o.number = true
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 16
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.ff = "unix"
vim.o.autoread = true
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "81"
vim.o.exrc = true
vim.o.secure = true
vim.o.updatetime = 500

if vim.fn.has("termguicolors") then
   vim.o.termguicolors = true
end

vim.o.list = true

if vim.fn.exists("utf8") then
   vim.o.listchars = "tab:❯ ,trail:·"
else
   vim.o.listchars = "tab:> ,trail:."
end

vim.cmd([[
   autocmd TermOpen * setlocal nonumber norelativenumber
   autocmd TermOpen * startinsert
]])

if pkg.has("gruvbox.nvim") or pkg.has("gruvbox") then
   vim.g.gruvbox_contrast_dark = "hard"
   vim.g.gruvbox_sign_column = "bg0"
   vim.cmd("colorscheme gruvbox")
end

if _G["clean_whitespace"] then
   vim.cmd([[ autocmd BufWritePre <buffer> :call v:lua.clean_whitespace() ]])
end

if _G["smart_semicolon"] then
   vim.cmd([[ autocmd FileType c inoremap ; <cmd>:call v:lua.smart_semicolon()<cr> ]])
   vim.cmd([[ autocmd FileType cpp inoremap ; <cmd>:call v:lua.smart_semicolon()<cr> ]])
   vim.cmd([[ autocmd FileType rust inoremap ; <cmd>:call v:lua.smart_semicolon()<cr> ]])
   vim.cmd([[ autocmd FileType javascript inoremap ; <cmd>:call v:lua.smart_semicolon()<cr> ]])
end

if pkg.has("nvim-projectconfig") then
   require("nvim-projectconfig").load_project_config({
      project_dir = vim.fn.stdpath("data") .. "/projects/",
   })

   spc("pe", "<cmd>lua require('nvim-projectconfig').edit_project_config()<cr>", "Edit config")
end
