local M = {}

local util = require("util")

M.termcodes = util.termcodes

M.doc = {}

local tab_providers = {
   function()
      if vim.fn.pumvisible() == 1 then
         return M.termcodes"<C-n>"
      end
   end,
}

local s_tab_providers = {
   function()
      if vim.fn.pumvisible() == 1 then
         return M.termcodes"<C-p>"
      end
   end,
}

_G.smart_tab = function()
   return util.first_non_nil_result(tab_providers, M.termcodes"<Tab>")
end

_G.smart_s_tab = function()
   return util.first_non_nil_result(s_tab_providers, M.termcodes"<S-Tab>")
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

function _G.smart_semicolon()
    local line = vim.fn.getline(".")
    local len = vim.fn.strlen(line)

    if vim.fn.col(".") > len then
        -- Column n+1 of n, inserting here adds an extra space,
        -- backspace at the start to remove it
        vim.api.nvim_feedkeys(M.termcodes"<bs><c-v>;", "m", true)
        return
    end

    local chr = vim.fn.strcharpart(
        vim.fn.strpart(line, vim.fn.col(".") - 1), 0, 1)

    while vim.fn.col(".") - 1 < len and
        (chr == ")" or chr == "}" or chr == "]") do
        vim.fn.cursor(vim.fn.line("."), vim.fn.col(".") + 1)
        chr = vim.fn.strcharpart(
            vim.fn.strpart(line, vim.fn.col(".") - 1), 0, 1)
    end

    vim.api.nvim_feedkeys(M.termcodes"<c-v>;", "m", true)
end

return M
