local M = {}

M.hooks = {
   on_attach = {},
   on_init = {},
}

local pkg = require("pkg")
local util = require("util")

local server_settings = {
   lua = {
      Lua = {
         runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
         },
         diagnostics = {
            globals = {'vim'},
         },
         workspace = {
            library = {
               [vim.fn.expand('$VIMRUNTIME/lua')] = true,
               [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
         },
      }
   }
}

local function make_config()
   local caps = vim.lsp.protocol.make_client_capabilities()
   caps.textDocument.completion.completionItem.snippetSupport = true

   caps.textDocument.completion.completionItem.resolveSupport = {
      properties = {
         "documentation",
         "detail",
         "additionalTextEdits",
      }
   }

   return {
      capabilities = caps,
      on_attach = function(client, bufnr)
         util.call_all(M.hooks.on_attach, client, bufnr)
      end,
      handlers = {
         ["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false}
         )
      },
   }
end

if pkg.has("nvim-lspconfig") then
   M.config = require("lspconfig")

   table.insert(M.hooks.on_init, function(servers)
      for _, server in pairs(servers) do
         local config = make_config()

         if server_settings[server] then
            config.settings = server_settings[server]
         end

         M.config[server].setup(config)
      end
   end)
end

if pkg.has("nvim-lspinstall") then
   M.installer = require("lspinstall")

   M.installer.post_install_hook = function()
      M.init()
      vim.cmd("bufdo e")
   end
end

if pkg.has("completion-nvim") then
   table.insert(M.hooks.on_attach,
      require("completion").on_attach)
end

function M.on_attach(f)
   table.insert(M.hooks.on_attach, f)
end

function M.init(options)
   options = options or {}
   local servers = options.servers

   if M.installer then
      M.installer.setup()
      servers = servers or M.installer.installed_servers()
   end

   util.call_all(M.hooks.on_init, servers or {})
end

function M.use_icons()
   local signs = {
      Error = " ",
      Warning = " ",
      Hint = " ",
      Information = " ",
   }

   for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, {
         text = icon,
         texthl = hl,
         numhl = "",
      })
   end

   local icons = {
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Enum = "了 ",
      EnumMember = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = "ﰮ ",
      Keyword = " ",
      Method = "ƒ ",
      Module = " ",
      Property = " ",
      Snippet = "﬌ ",
      Struct = " ",
      Text = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
   }

   local kinds = vim.lsp.protocol.CompletionItemKind
   for i, kind in ipairs(kinds) do
      if icons[kind] then
         kinds[i] = icons[kind] .. kind
      end
   end
end

return M
