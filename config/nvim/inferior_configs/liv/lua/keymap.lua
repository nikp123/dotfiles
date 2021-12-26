local M = {}

local pkg = require("pkg")
local util = require("util")

local tc = util.termcodes

M.doc = {}

local tab_providers = {
   function()
      if vim.fn.pumvisible() == 1 then
         return tc"<C-n>"
      end
   end,
}

local s_tab_providers = {
   function()
      if vim.fn.pumvisible() == 1 then
         return tc"<C-p>"
      end
   end,
}

if pkg.has("vim-vsnip") then
   table.insert(tab_providers,
      function()
         if vim.fn["vsnip#jumpable"](1) == 1 then
            return tc"<Plug>(vsnip-jump-next)"
         end
      end)

   table.insert(s_tab_providers,
      function()
         if vim.fn["vsnip#jumpable"](-1) == 1 then
            return tc"<Plug>(vsnip-jump-prev)"
         end
      end)
end

_G.smart_tab = function()
   return util.first_non_nil_result(tab_providers, tc"<Tab>")
end

_G.smart_s_tab = function()
   return util.first_non_nil_result(s_tab_providers, tc"<S-Tab>")
end

local function key_group(m, keys)
   if #keys == 1 then
      return m
   else
      local c = keys:sub(1, 1)
      m[c] = m[c] or {}
      return key_group(m[c], keys:sub(2))
   end
end

local function key_doc(m, keys, doc)
   local group = key_group(m, keys)
   group[keys:sub(-1, -1)] = doc
end

function M.map(modes, keys, cmd, opts)
   opts = opts or { noremap = true, silent = true }

   for i = 1, #modes do
      local mode = modes:sub(i, i)
      vim.api.nvim_set_keymap(mode, keys, cmd, opts)
   end
end

function M.buf_map(bufnr, modes, keys, cmd, opts)
   opts = opts or { noremap = true, silent = true }

   for i = 1, #modes do
      local mode = modes:sub(i, i)
      vim.api.nvim_buf_set_keymap(bufnr, mode, keys, cmd, opts)
   end
end

function M.spc_group(keys, name)
   local group = key_group(M.doc, keys)
   local c = keys:sub(-1, -1)
   group[c] = group[c] or {}
   group[c].name = name
end

function M.spc(keys, cmd, doc, modes, opts)
   modes = modes or "n"
   M.map(modes, "<leader>" .. keys, cmd, opts)

   if doc then
      key_doc(M.doc, keys, doc)
   end
end

function M.buf_spc(bufnr, keys, cmd, doc, modes, opts)
   modes = modes or "n"
   M.buf_map(bufnr, modes, "<leader>" .. keys, cmd, opts)

   if doc then
      key_doc(M.doc, keys, doc)
   end
end

function M.init()
   local opts = { expr = true }
   M.map("si", "<Tab>", "v:lua.smart_tab()", opts)
   M.map("si", "<S-Tab>", "v:lua.smart_s_tab()", opts)
end

return M
