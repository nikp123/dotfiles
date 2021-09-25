local M = {}

if not _G.dump then
   function _G.dump(...)
      local objects = vim.tbl_map(vim.inspect, {...})
      print(unpack(objects))
      return ...
   end
end

if not _G.clean_whitespace then
   function _G.clean_whitespace()
      local l = vim.fn.line(".")
      local c = vim.fn.col(".")

      if vim.b.current_syntax == "markdown" then
         vim.cmd([[ %s/\>\(\s\|\s\s\s\+\)$//e ]])
      else
         vim.cmd([[ %s/\s\+$//e ]])
      end

      vim.fn.cursor(l, c)
   end
end

function M.call_all(fs, ...)
   for _, f in ipairs(fs) do
      f(...)
   end
end

function M.termcodes(keys)
   return vim.api.nvim_replace_termcodes(keys, true, true, true)
end

function M.first_non_nil_result(fs, default, ...)
   for _, f in ipairs(fs) do
      local result = f(...)

      if result ~= nil then
         return result
      end
   end

   return default
end

return M
