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

if not _G.smart_semicolon then
   function _G.smart_semicolon()
      -- Why does my typeahead permanently have a space, aaaaaaaaaaaaaaaaa
      while vim.fn.getchar(0) ~= 0 do end

      local linetext = M.line_text()
      local line, col = M.getcursor()

      if string.find(linetext, "for%s*%(") then
         local line_to_cursor = string.sub(linetext, 1, col)
         if select(2, string.gsub(line_to_cursor, ";", "")) < 2 then
            vim.api.nvim_feedkeys(M.termcodes"<c-v>; ", "m", true)
            return
         end
      end

      local chr = string.sub(linetext, col, col)

      while col <= string.len(linetext) and string.find(chr, "[%)%}%]]") do
         col = col + 1
         M.setcursor(line, col)
         chr = string.sub(linetext, col, col)
      end

      vim.api.nvim_feedkeys(M.termcodes"<c-v>;", "m", true)
   end
end

function M.line_text()
   return vim.fn.getline(".")
end

function M.getcursor()
   return vim.fn.line("."), vim.fn.col(".")
end

function M.setcursor(l, c)
   vim.fn.cursor(l, c)
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
