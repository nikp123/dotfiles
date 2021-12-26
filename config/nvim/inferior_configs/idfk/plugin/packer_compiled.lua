-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nikp123/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/nikp123/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/nikp123/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/nikp123/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nikp123/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["SyntaxAttr.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/SyntaxAttr.vim",
    url = "https://github.com/inkarkat/SyntaxAttr.vim"
  },
  ["animate.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/animate.vim",
    url = "https://github.com/camspiers/animate.vim"
  },
  ["ats2.vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/ats2.vim",
    url = "https://github.com/bakpakin/ats2.vim"
  },
  ["cheatsheet.nvim"] = {
    commands = { "Cheatsheet" },
    config = { "\27LJ\1\2O\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\15cheatsheet\19load_extension\14telescope\frequire\0" },
    keys = { { "", "<leader>?" } },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim",
    wants = { "telescope.nvim" }
  },
  ["coc.nvim"] = {
    after = { "lualine.nvim" },
    config = { "\27LJ\1\2ı'\0\0\6\0\f\0\0224\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0%\2\4\0%\3\5\0%\4\6\0%\5\a\0$\1\5\1>\0\2\0014\0\0\0007\0\1\0%\1\b\0%\2\t\0%\3\n\0%\4\v\0$\1\4\1>\0\2\1G\0\1\0Q  nnoremap <buffer><silent> <leader>cz :CocCommand latex.ForwardSearch<cr>  Q  nnoremap <buffer><silent> <leader>cB :CocCommand latex.BuildCancel<cr>   |Q  nnoremap <buffer><silent> <leader>cb :CocCommand latex.Build<cr>         |Qautocmd init FileType tex                                                   Ç\1  exec printf('hi CocHintHighlight    gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocHintSign'   , v:true).foreground)  Ç\1  exec printf('hi CocInfoHighlight    gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocInfoSign'   , v:true).foreground) |Ç\1  exec printf('hi CocWarningHighlight gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocWarningSign', v:true).foreground) |Ç\1  exec printf('hi CocErrorHighlight   gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocErrorSign'  , v:true).foreground) |Ç\1autocmd init VimEnter,ColorScheme *                                                                                          ‚\31                nmap     <silent>       <leader>cf <Plug>(coc-format)\n                vmap     <silent>       <leader>cf <Plug>(coc-format-selected)\n                nmap     <silent>       <leader>cA <Plug>(coc-codeaction)\n                nmap     <silent>       <leader>ca <Plug>(coc-codeaction-cursor)\n                vmap     <silent>       <leader>ca <Plug>(coc-codeaction-selected)\n                nmap     <silent>       <leader>cl <Plug>(coc-codelens-action)\n                nmap     <silent>       <leader>cI <Plug>(coc-diagnostic-info)\n                nmap     <silent>       <leader>c[ <Plug>(coc-diagnostic-prev)\n                nmap     <silent>       <leader>c] <Plug>(coc-diagnostic-next)\n                nmap     <silent>       <leader>cg :call CocAction('diagnosticToggle')<cr>\n                nmap     <silent>       <leader>cd <Plug>(coc-definition)\n                nmap     <silent>       <leader>cD <Plug>(coc-declaration)\n                nmap     <silent>       <leader>ci <Plug>(coc-implementation)\n                nmap     <silent>       <leader>ct <Plug>(coc-type-definition)\n                nmap     <silent>       <leader>cn <Plug>(coc-rename)\n                nmap     <silent>       <leader>cr <Plug>(coc-references)\n                nmap     <silent>       <leader>cu <Plug>(coc-references-used)\n                nmap     <silent>       <leader>cR <Plug>(coc-refactor)\n                nmap     <silent>       <leader>co <Plug>(coc-openlink)\n                nmap     <silent>       <leader>cq <Plug>(coc-fix-current)\n                nmap     <silent>       <leader>cC <Plug>(coc-git-commit)\n                nmap     <silent>               [h <Plug>(coc-git-prevchunk)\n                nmap     <silent>               ]h <Plug>(coc-git-nextchunk)\n                nmap     <silent>       <leader>hp <Plug>(coc-git-chunkinfo)\n                nnoremap <silent>       <leader>hu :CocCommand git.chunkUndo<cr>\n                nnoremap <silent>       <leader>hs :CocCommand git.chunkStage<cr>\n                nmap                    <leader>cT <Plug>(coc-translator-p)\n                nnoremap <silent>       <leader>ch :call CocActionAsync('doHover')<cr>\n                vnoremap <silent>       <leader>ch <cmd>call CocActionAsync('doHover')<cr>\n                nnoremap <silent>       <leader>cH :call CocActionAsync('highlight')<cr>\n                nnoremap <silent>      <leader>cci :call CocAction('incomingCalls')<cr>\n                nnoremap <silent>      <leader>cco :call CocAction('outgoingCalls')<cr>\n                inoremap <silent>       <c-space>s <cmd>call CocActionAsync('showSignatureHelp')<cr>\n                nnoremap <silent><expr>      <c-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : \":lua require('tmux').move_bottom()<cr>\"\n                nnoremap <silent><expr>      <c-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : \":lua require('tmux').move_top()<cr>\"\n                inoremap <silent><expr>      <c-j> coc#float#has_scroll() ? \"\\<c-r>=coc#float#scroll(1, 1)\\<cr>\" : \"\\<c-j>\"\n                inoremap <silent><expr>      <c-k> coc#float#has_scroll() ? \"\\<c-r>=coc#float#scroll(0, 1)\\<cr>\" : \"\\<c-k>\"\n                vnoremap <silent><expr>      <c-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : \"\\<c-j>\"\n                vnoremap <silent><expr>      <c-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : \"\\<c-k>\"\n                inoremap <silent><expr>      <c-y> pumvisible() ? coc#_select_confirm() : \"\\<c-y>\"\n                inoremap <silent><expr> <c-space>r coc#refresh()\n                nnoremap <silent>       <leader>cF :call CocActionAsync('fold')<cr>\n\n                inoremap <silent><expr>       <cr> pumvisible() ? \"\\<c-e>\\<cr>\" : \"\\<cr>\"\n\n                autocmd init CursorHold * call CocActionAsync('diagnosticRefresh')\n                autocmd init CompleteChanged * call coc#float#close_all()\n                autocmd init User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')\n                autocmd init VimEnter,ColorScheme * hi! link CocFloating Pmenu\n            \bcmd\bvim\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    config = { "vim.g['codi#virtual_text_prefix'] = '‚ñ† '" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/codi.vim",
    url = "https://github.com/metakirby5/codi.vim"
  },
  ["cypher.vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/cypher.vim",
    url = "https://github.com/memgraph/cypher.vim"
  },
  ["dart-vim-plugin"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/dart-vim-plugin",
    url = "https://github.com/dart-lang/dart-vim-plugin"
  },
  ["dhall-vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/dhall-vim",
    url = "https://github.com/vmchale/dhall-vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    keys = { { "", "<c-space>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ferret = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/ferret",
    url = "https://github.com/wincent/ferret"
  },
  ["haskell-vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  hexmode = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/hexmode",
    url = "https://github.com/fidian/hexmode"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\1\2ÿ\2\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0∏\2                nnoremap <silent> <leader>Hw :HopWord<cr>\n                nnoremap <silent> <leader>Hl :HopLine<cr>\n                nnoremap <silent> <leader>H1 :HopChar1<cr>\n                nnoremap <silent> <leader>H2 :HopChar2<cr>\n                nnoremap <silent> <leader>Hp :HopPattern<cr>\n            \bcmd\bvim\0" },
    keys = { { "", "<leader>H" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["i3config.vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/i3config.vim",
    url = "https://github.com/mboughaba/i3config.vim"
  },
  ["idris-vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/idris-vim",
    url = "https://github.com/idris-hackers/idris-vim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2Î\2\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\21filetype_exclude\1\23\0\0\vpacker\rNvimTree\nvista\15vista_kind\fcoctree\tdbui\nMundo\14MundoDiff\18dapui_watches\17dapui_stacks\22dapui_breakpoints\17dapui_scopes\15dapui_repl\rdap-repl\thelp\5\vpython\fhaskell\rlhaskell\15purescript\rmarkdown\vpandoc\20buftype_exclude\1\2\0\0\rterminal\1\0\2\25show_current_context\2\tchar\bÓò°\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jsonc.vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/jsonc.vim",
    url = "https://github.com/neoclide/jsonc.vim"
  },
  ["julia-vim"] = {
    loaded = true,
    needs_bufread = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/julia-vim",
    url = "https://github.com/JuliaEditorSupport/julia-vim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/kotlin-vim",
    url = "https://github.com/udalov/kotlin-vim"
  },
  ["lens.vim"] = {
    config = { "\27LJ\1\2ô\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0z                let g:lens#disabled = 1\n                nnoremap <silent> <leader>L :call lens#run()<cr>\n            \bcmd\bvim\0" },
    keys = { { "", "<leader>L" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/lens.vim",
    url = "https://github.com/camspiers/lens.vim",
    wants = { "animate.vim" }
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2ë\b\0\0\f\0001\0q4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0003\3\4\0:\3\5\2:\2\a\0013\2\t\0003\3\b\0:\3\n\0023\3\v\0003\4\f\0003\5\r\0:\5\14\0043\5\21\0004\6\15\0007\6\16\0067\6\17\0067\6\18\0067\6\19\6%\a\20\0$\6\a\6:\6\22\0054\6\15\0007\6\16\0067\6\17\0067\6\18\0067\6\23\6%\a\20\0$\6\a\6:\6\24\0054\6\15\0007\6\16\0067\6\17\0067\6\18\0067\6\25\6%\a\20\0$\6\a\6:\6\26\0054\6\15\0007\6\16\0067\6\17\0067\6\18\0067\6\27\6%\a\20\0$\6\a\6:\6\28\5:\5\29\0043\5'\0003\6%\0004\a\30\0007\a\31\a%\b \0004\t\15\0007\t!\t7\t\"\t%\n#\0)\v\2\0>\t\3\0027\t$\t>\a\3\2:\a&\6:\6\22\0053\6)\0004\a\30\0007\a\31\a%\b \0004\t\15\0007\t!\t7\t\"\t%\n(\0)\v\2\0>\t\3\0027\t$\t>\a\3\2:\a&\6:\6\24\0053\6+\0004\a\30\0007\a\31\a%\b \0004\t\15\0007\t!\t7\t\"\t%\n*\0)\v\2\0>\t\3\0027\t$\t>\a\3\2:\a&\6:\6\26\0053\6-\0004\a\30\0007\a\31\a%\b \0004\t\15\0007\t!\t7\t\"\t%\n,\0)\v\2\0>\t\3\0027\t$\t>\a\3\2:\a&\6:\6\28\5:\5.\4;\4\2\3:\3/\2:\0020\1>\0\2\1G\0\1\0\rsections\14lualine_x\22diagnostics_color\1\0\0\16CocHintSign\1\0\0\16CocInfoSign\1\0\0\19CocWarningSign\1\0\0\afg\1\0\0\15foreground\17CocErrorSign\24nvim_get_hl_by_name\bapi\n#%06x\vformat\vstring\fsymbols\thint\rhintSign\tinfo\rinfoSign\twarn\16warningSign\nerror\1\0\0\6 \14errorSign\15diagnostic\20coc_user_config\6g\bvim\fsources\1\2\0\0\bcoc\1\2\0\0\16diagnostics\1\6\0\0\17g:coc_status\0\rencoding\15fileformat\rfiletype\14lualine_b\1\0\0\1\2\0\0\vbranch\foptions\1\0\0\23disabled_filetypes\1\15\0\0\vpacker\rNvimTree\nvista\15vista_kind\fcoctree\tdbui\nMundo\14MundoDiff\18dapui_watches\17dapui_stacks\22dapui_breakpoints\17dapui_scopes\15dapui_repl\rdap-repl\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["neco-vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/neco-vim",
    url = "https://github.com/Shougo/neco-vim"
  },
  ["neoscroll.nvim"] = {
    config = { "require('neoscroll').setup{}" },
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  neoterm = {
    loaded = false,
    needs_bufread = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\1\2g\0\0\4\0\a\0\f4\0\0\0007\0\1\0007\0\2\0%\1\3\0004\2\0\0007\2\1\0027\2\4\2>\2\1\2%\3\5\0$\2\3\2%\3\6\0@\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimg\0\0\4\0\a\0\f4\0\0\0007\0\1\0007\0\2\0%\1\3\0004\2\0\0007\2\1\0027\2\4\2>\2\1\2%\3\5\0$\2\3\2%\3\6\0@\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimX\0\0\4\0\6\0\n4\0\0\0007\0\1\0007\0\2\0%\1\3\0004\2\0\0007\2\1\0027\2\4\2>\2\1\2%\3\5\0@\0\4\0\bdir\vgetcwd\21Path to module: \ninput\afn\bvimÃ\27\1\0\a\0001\0`4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0027\1\4\0007\1\5\1%\2\a\0:\2\6\0014\1\b\0007\1\t\1%\2\n\0%\3\v\0%\4\f\0%\5\r\0$\2\5\2>\1\2\0014\1\0\0%\2\14\0>\1\2\0027\1\2\1%\2\15\0>\1\2\0014\1\b\0007\1\16\0017\1\17\1%\2\18\0>\1\2\0027\2\19\0003\3\21\0002\4\3\0\16\5\1\0%\6\22\0$\5\6\5;\5\1\4:\4\23\3:\3\20\0027\2\24\0002\3\3\0003\4\26\0002\5\0\0:\5\23\0042\5\0\0:\5\27\4\16\5\1\0%\6\28\0$\5\6\5:\5\29\4\16\5\1\0%\6\30\0$\5\6\5:\5\31\4;\4\1\3:\3\25\0027\2\19\0003\3!\0:\3 \0027\2\24\0002\3\3\0003\4#\0001\5$\0:\5%\4;\4\1\3:\3\"\0027\2\24\0007\3\24\0007\3\"\3:\3&\0027\2\24\0002\3\3\0003\4(\0001\5)\0:\5%\0043\5*\0:\5+\4;\4\1\3:\3'\0027\2\19\0003\3-\0:\3,\0027\2\24\0002\3\3\0003\4.\0001\5/\0:\5%\4;\4\1\3:\3,\0024\2\b\0007\2\t\2%\0030\0>\2\2\1G\0\1\0ò\16                nnoremap <silent> <leader>dg :lua require('dap').continue()<cr>\n                nnoremap <silent> <leader>dG :lua require('dap').run_to_cursor()<cr>\n                nnoremap <silent> <leader>dp :lua require('dap').pause()<cr>\n                nnoremap <silent> <leader>dd :lua require('dap').disconnect();require('dap').close();require('dapui').close()<cr>\n                nnoremap <silent> <leader>db :lua require('dap').toggle_breakpoint()<cr>\n                nnoremap <silent> <leader>dt :lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Tracepoint message: '))<cr>\n                nnoremap <silent> <leader>dc :lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>\n                nnoremap <silent> <leader>di :lua require('dap').step_into()<cr>\n                nnoremap <silent> <leader>do :lua require('dap').step_over()<cr>\n                nnoremap <silent> <leader>dO :lua require('dap').step_out()<cr>\n                nnoremap <silent> <leader>dh :lua require('dap').step_back()<cr>\n                nnoremap <silent> <leader>dr :lua require('dap').repl.toggle()<cr>\n\n                nnoremap <silent> <leader>de :lua require('dapui').eval()<cr>\n                vnoremap <silent> <leader>de <cmd>lua require('dapui').eval()<cr>\n\n                vnoremap <silent> <leader>ds <cmd>lua require('dap-python').debug_selection()<cr>\n\n                sign define DapStopped             text=ÔÇ©Ô∏è texthl=CocHintSign linehl=CursorLine\n                sign define DapLogPoint            text=ÔÅ™Ô∏è texthl=CocWarningSign\n                sign define DapBreakpoint          text=ÔäçÔ∏è texthl=CocErrorSign\n                sign define DapBreakpointRejected  text=ÔäçÔ∏è texthl=CocInfoSign\n                sign define DapBreakpointCondition text=ÔÅôÔ∏è texthl=CocErrorSign\n\n                autocmd init BufEnter DAP\\ Breakpoints,DAP\\ Stacks,DAP\\ Scopes set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline\n                autocmd init BufLeave DAP\\ Breakpoints,DAP\\ Stacks,DAP\\ Scopes set guicursor&\n            \0\1\0\2\frequest\vlaunch\ttype\ago\1\0\3\tport\3…e\thost\014127.0.0.1\ttype\vserver\ago\20sourceLanguages\1\2\0\0\trust\0\1\0\4\frequest\vlaunch\bcwd\23${workspaceFolder}\ttype\rcodelldb\rterminal\15integrated\trust\bcpp\fprogram\0\1\0\4\frequest\vlaunch\bcwd\23${workspaceFolder}\ttype\rcodelldb\rterminal\15integrated\6c\1\0\3\tport\3»e\thost\014127.0.0.1\ttype\vserver\rcodelldb\18pathBashdbLib\16/bashdb_dir\15pathBashdb\23/bashdb_dir/bashdb\benv\1\0\t\rpathBash\tbash\ttype\vbashdb\fpathCat\bcat\15pathMkfifo\vmkfifo\14pathPkill\npkill\bcwd\23${workspaceFolder}\17terminalKind\15integrated\fprogram\f${file}\frequest\vlaunch\ash\19configurations\targs\22/out/bashDebug.js\1\0\2\fcommand\tnode\ttype\15executable\vbashdb\radapters7~/Downloads/vscode-extensions/bash-debug/extension\tglob\afn\20/usr/bin/python\15dap-pythonFcatch | endtry                                                   F  exec 'bd! ' . expand('<abuf>')                                |F  call nvim_buf_get_var(eval(expand('<abuf>')), 'dap_terminal') |Fautocmd init TermClose * try                                    |\bcmd\bvim.belowright new +let\\ b:dap_terminal\\ =\\ 1\21terminal_win_cmd\rfallback\rdefaults\bdap\nsetup\ndapui\frequire\0" },
    keys = { { "", "<leader>d" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2ù\3\0\0\5\0\14\1\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\n\0003\2\b\0004\3\3\0007\3\4\0034\4\5\0007\4\6\0047\4\a\4\23\4\0\4>\3\2\2:\3\t\2:\2\v\1>\0\2\0014\0\5\0007\0\f\0%\1\r\0>\0\2\1G\0\1\0ˇ\1                nnoremap <silent> <leader>k :NvimTreeToggle<cr>\n\n                autocmd init BufEnter NvimTree set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline\n                autocmd init BufLeave NvimTree set guicursor&\n            \bcmd\tview\1\0\0\nwidth\1\0\0\fcolumns\6o\bvim\tmodf\tmath\nsetup\14nvim-tree\frequire\b\0" },
    keys = { { "", "<leader>k" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua",
    wants = { "nvim-web-devicons" }
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2Á\1\0\0\4\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0003\3\5\0:\3\6\2:\2\a\0013\2\b\0003\3\t\0:\3\n\2:\2\v\1>\0\2\1G\0\1\0\17textsubjects\fkeymaps\1\0\1\6.\23textsubjects-smart\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["open-browser.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/open-browser.vim",
    url = "https://github.com/tyru/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pgsql.vim"] = {
    loaded = true,
    needs_bufread = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/pgsql.vim",
    url = "https://github.com/lifepillar/pgsql.vim"
  },
  ["plantuml-previewer.vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/plantuml-previewer.vim",
    url = "https://github.com/weirongxu/plantuml-previewer.vim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["purescript-vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/purescript-vim",
    url = "https://github.com/purescript-contrib/purescript-vim"
  },
  ["rest.nvim"] = {
    config = { "require('rest-nvim').setup{}" },
    keys = { { "", "<Plug>RestNvim" }, { "", "<Plug>RestNvimPreview" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim",
    wants = { "plenary.nvim" }
  },
  ["rose-pine"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\26colorscheme rose-pine\bcmd\bvim\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["swift.vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/swift.vim",
    url = "https://github.com/keith/swift.vim"
  },
  tabular = {
    after_files = { "/home/nikp123/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-coc.nvim"] = {
    config = { "\27LJ\1\2∏\t\0\0\2\0\a\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\4\0007\0\5\0%\1\6\0>\0\2\1G\0\1\0€\b                nnoremap <silent> <leader>oca :Telescope coc code_actions<cr>\n                nnoremap <silent> <leader>ocA :Telescope coc file_code_actions<cr>\n                nnoremap <silent> <leader>ocd :Telescope coc definitions<cr>\n                nnoremap <silent> <leader>ocD :Telescope coc declarations<cr>\n                nnoremap <silent> <leader>oci :Telescope coc implementations<cr>\n                nnoremap <silent> <leader>oct :Telescope coc type_definitions<cr>\n                nnoremap <silent> <leader>ocr :Telescope coc references<cr>\n                nnoremap <silent> <leader>oco :Telescope coc links<cr>\n                nnoremap <silent> <leader>oce :Telescope coc diagnostics<cr>\n                nnoremap <silent> <leader>ocE :Telescope coc workspace_diagnostics<cr>\n                nnoremap <silent> <leader>ocs :Telescope coc document_symbols<cr>\n                nnoremap <silent> <leader>ocS :Telescope coc workspace_symbols<cr>\n                nnoremap <silent> <leader>occ :Telescope coc commands<cr>\n                nnoremap <silent> <leader>ocu :Telescope coc mru<cr>\n            \bcmd\bvim\bcoc\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/telescope-coc.nvim",
    url = "https://github.com/fannheyward/telescope-coc.nvim",
    wants = { "coc.nvim" }
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\1\2Ì\3\0\0\2\0\a\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\4\0007\0\5\0%\1\6\0>\0\2\1G\0\1\0ê\3                nnoremap <silent> <leader>odb :Telescope dap list_breakpoints<cr>\n                nnoremap <silent> <leader>odv :Telescope dap variables<cr>\n                nnoremap <silent> <leader>odf :Telescope dap frames<cr>\n                nnoremap <silent> <leader>odc :Telescope dap commands<cr>\n                nnoremap <silent> <leader>ods :Telescope dap configurations<cr>\n            \bcmd\bvim\bdap\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim",
    wants = { "nvim-dap" }
  },
  ["telescope.nvim"] = {
    after = { "telescope-dap.nvim", "cheatsheet.nvim", "telescope-coc.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\1\2Ω\a\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0ù\a                nnoremap <silent>   <leader>O :Telescope<cr>\n\n                nnoremap <silent>  <leader>om :Telescope marks<cr>\n                nnoremap <silent>  <leader>oq :Telescope quickfix<cr>\n                nnoremap <silent>  <leader>ol :Telescope loclist<cr>\n                nnoremap <silent>  <leader>ot :Telescope current_buffer_tags<cr>\n                nnoremap <silent>  <leader>oT :Telescope tags<cr>\n                nnoremap <silent>  <leader>ob :Telescope buffers<cr>\n                nnoremap <silent>  <leader>of :Telescope find_files<cr>\n                nnoremap <silent>  <leader>oF :Telescope fd<cr>\n                nnoremap <silent>  <leader>og :Telescope live_grep<cr>\n                nnoremap <silent>  <leader>oo :Telescope treesitter<cr>\n\n                nnoremap <silent> <leader>ogf :Telescope git_files<cr>\n                nnoremap <silent> <leader>ogc :Telescope git_commits<cr>\n            \bcmd\bvim\0" },
    keys = { { "n", "<leader>O" }, { "n", "<leader>o" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim" }
  },
  ["tmux-complete.vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/tmux-complete.vim",
    url = "https://github.com/wellle/tmux-complete.vim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\1\2£\n\0\0\3\0\t\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\0014\0\6\0007\0\a\0%\1\b\0>\0\2\1G\0\1\0±\t                nnoremap <silent> <c-h> :lua require('tmux').move_left()<cr>\n                nnoremap <silent> <c-l> :lua require('tmux').move_right()<cr>\n\n                tnoremap <silent> <c-h> <c-\\><c-n>:lua require('tmux').move_left()<cr>\n                tnoremap <silent> <c-j> <c-\\><c-n>:lua require('tmux').move_bottom()<cr>\n                tnoremap <silent> <c-k> <c-\\><c-n>:lua require('tmux').move_top()<cr>\n                tnoremap <silent> <c-l> <c-\\><c-n>:lua require('tmux').move_right()<cr>\n\n                nnoremap <silent> <m-h> :lua require('tmux').resize_left()<cr>\n                nnoremap <silent> <m-j> :lua require('tmux').resize_bottom()<cr>\n                nnoremap <silent> <m-k> :lua require('tmux').resize_top()<cr>\n                nnoremap <silent> <m-l> :lua require('tmux').resize_right()<cr>\n\n                tnoremap <silent> <m-h> <c-\\><c-n>:lua require('tmux').resize_left()<cr>\n                tnoremap <silent> <m-j> <c-\\><c-n>:lua require('tmux').resize_bottom()<cr>\n                tnoremap <silent> <m-k> <c-\\><c-n>:lua require('tmux').resize_top()<cr>\n                tnoremap <silent> <m-l> <c-\\><c-n>:lua require('tmux').resize_right()<cr>\n            \bcmd\bvim\15navigation\1\0\0\1\0\1\17persist_zoom\2\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "require('todo-comments').setup{}" },
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim",
    wants = { "plenary.nvim" }
  },
  ["translate-shell.vim"] = {
    after_files = { "/home/nikp123/.local/share/nvim/site/pack/packer/opt/translate-shell.vim/after/plugin/fzf.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/translate-shell.vim",
    url = "https://github.com/echuraev/translate-shell.vim"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight", "TwilightEnable" },
    config = { "require('twilight').setup{}" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  vfix = {
    commands = { "Vfix" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vfix",
    url = "https://github.com/Termplexed/vfix"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-applescript"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-applescript",
    url = "https://github.com/mityu/vim-applescript"
  },
  ["vim-autosource"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-autosource",
    url = "https://github.com/jenterkin/vim-autosource"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-choosewin"] = {
    config = { "\27LJ\1\2>\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\31nmap  -  <Plug>(choosewin)\bcmd\bvim\0" },
    keys = { { "", "-" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-choosewin",
    url = "https://github.com/t9md/vim-choosewin"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    config = { "\27LJ\1\2ù\2\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0˝\1                autocmd init FileType dbout DisableWhitespace\n                autocmd init BufEnter,WinEnter dbui set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline\n                autocmd init WinLeave dbui set guicursor&\n            \bcmd\bvim\0" },
    loaded = true,
    needs_bufread = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-diff-enhanced"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-diff-enhanced",
    url = "https://github.com/chrisbra/vim-diff-enhanced"
  },
  ["vim-dispatch"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-evanesco"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-evanesco",
    url = "https://github.com/pgdouyon/vim-evanesco"
  },
  ["vim-floaterm"] = {
    keys = { { "n", "<leader>F" }, { "n", "<leader>f" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-glsl"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-glsl",
    url = "https://github.com/tikhomirov/vim-glsl"
  },
  ["vim-gnupg"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-gnupg",
    url = "https://github.com/jamessan/vim-gnupg"
  },
  ["vim-grammarous"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-graphql"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-graphql",
    url = "https://github.com/jparise/vim-graphql"
  },
  ["vim-haskellConceal"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-haskellConceal",
    url = "https://github.com/Twinside/vim-haskellConceal"
  },
  ["vim-jsx-improve"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-jsx-improve",
    url = "https://github.com/chemzqm/vim-jsx-improve"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-less"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-less",
    url = "https://github.com/groenewege/vim-less"
  },
  ["vim-matchup"] = {
    after_files = { "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-maximizer"] = {
    config = { "\27LJ\1\2U\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0006nnoremap <silent> <leader>m :MaximizerToggle!<cr>\bcmd\bvim\0" },
    keys = { { "", "<leader>m" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-mergetool"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-mergetool",
    url = "https://github.com/samoshkin/vim-mergetool"
  },
  ["vim-mma"] = {
    loaded = true,
    needs_bufread = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-mma",
    url = "https://github.com/voldikss/vim-mma"
  },
  ["vim-mundo"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-obsession"] = {
    commands = { "Obsession" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-pandoc-syntax"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-pandoc-syntax",
    url = "https://github.com/vim-pandoc/vim-pandoc-syntax"
  },
  ["vim-pencil"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-pencil",
    url = "https://github.com/reedes/vim-pencil"
  },
  ["vim-plugin-AnsiEsc"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-plugin-AnsiEsc",
    url = "https://github.com/powerman/vim-plugin-AnsiEsc"
  },
  ["vim-qmake"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-qmake",
    url = "https://github.com/suy/vim-qmake"
  },
  ["vim-qml"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-qml",
    url = "https://github.com/peterhoeg/vim-qml"
  },
  ["vim-quickrun"] = {
    config = { "\27LJ\1\2O\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0000nmap <silent> <leader><cr> <Plug>(quickrun)\bcmd\bvim\0" },
    keys = { { "", "<leader><cr>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-quickrun",
    url = "https://github.com/thinca/vim-quickrun"
  },
  ["vim-quickui"] = {
    config = { "\27LJ\1\2•6\0\0\5\0w\0˛\0014\0\0\0007\0\1\0007\0\2\0>\0\1\0014\0\0\0007\0\1\0007\0\3\0%\1\4\0002\2\n\0003\3\5\0;\3\1\0023\3\6\0;\3\2\0023\3\a\0;\3\3\0023\3\b\0;\3\4\0023\3\t\0;\3\5\0023\3\n\0;\3\6\0023\3\v\0;\3\a\0023\3\f\0;\3\b\0023\3\r\0;\3\t\2>\0\3\0014\0\0\0007\0\1\0007\0\3\0%\1\14\0002\2&\0003\3\15\0;\3\1\0023\3\16\0;\3\2\0023\3\17\0;\3\3\0023\3\18\0;\3\4\0023\3\19\0;\3\5\0023\3\20\0;\3\6\0023\3\21\0;\3\a\0023\3\22\0;\3\b\0023\3\23\0;\3\t\0023\3\24\0;\3\n\0023\3\25\0;\3\v\0023\3\26\0;\3\f\0023\3\27\0;\3\r\0023\3\28\0;\3\14\0023\3\29\0;\3\15\0023\3\30\0;\3\16\0023\3\31\0;\3\17\0023\3 \0;\3\18\0023\3!\0;\3\19\0023\3\"\0;\3\20\0023\3#\0;\3\21\0023\3$\0;\3\22\0023\3%\0;\3\23\0023\3&\0;\3\24\0023\3'\0;\3\25\0023\3(\0;\3\26\0023\3)\0;\3\27\0023\3*\0;\3\28\0023\3+\0;\3\29\0023\3,\0;\3\30\0023\3-\0;\3\31\0023\3.\0;\3 \0023\3/\0;\3!\0023\0030\0;\3\"\0023\0031\0;\3#\0023\0032\0;\3$\0023\0033\0;\3%\2>\0\3\0014\0\0\0007\0\1\0007\0\3\0%\0014\0002\2%\0003\0035\0;\3\1\0023\0036\0;\3\2\0023\0037\0;\3\3\0023\0038\0;\3\4\0023\0039\0;\3\5\0023\3:\0;\3\6\0023\3;\0;\3\a\0023\3<\0;\3\b\0023\3=\0;\3\t\0023\3>\0;\3\n\0023\3?\0;\3\v\0023\3@\0;\3\f\0023\3A\0;\3\r\0023\3B\0;\3\14\0023\3C\0;\3\15\0023\3D\0;\3\16\0023\3E\0;\3\17\0023\3F\0;\3\18\0023\3G\0;\3\19\0023\3H\0;\3\20\0023\3I\0;\3\21\0023\3J\0;\3\22\0023\3K\0;\3\23\0023\3L\0;\3\24\0023\3M\0;\3\25\0023\3N\0;\3\26\0023\3O\0;\3\27\0023\3P\0;\3\28\0023\3Q\0;\3\29\0023\3R\0;\3\30\0023\3S\0;\3\31\0023\3T\0;\3 \0023\3U\0;\3!\0023\3V\0;\3\"\0023\3W\0;\3#\0023\3X\0;\3$\2>\0\3\0014\0\0\0007\0\1\0007\0\3\0%\1Y\0002\2\16\0003\3Z\0;\3\1\0023\3[\0;\3\2\0023\3\\\0;\3\3\0023\3]\0;\3\4\0023\3^\0;\3\5\0023\3_\0;\3\6\0023\3`\0;\3\a\0023\3a\0;\3\b\0023\3b\0;\3\t\0023\3c\0;\3\n\0023\3d\0;\3\v\0023\3e\0;\3\f\0023\3f\0;\3\r\0023\3g\0;\3\14\0023\3h\0;\3\15\2%\3i\0%\4j\0>\0\5\0014\0\0\0007\0\1\0007\0\3\0%\1k\0002\2\n\0003\3l\0;\3\1\0023\3m\0;\3\2\0023\3n\0;\3\3\0023\3o\0;\3\4\0023\3p\0;\3\5\0023\3q\0;\3\6\0023\3r\0;\3\a\0023\3s\0;\3\b\0023\3t\0;\3\t\2'\3\16'>\0\4\0014\0\0\0007\0u\0%\1v\0>\0\2\1G\0\1\0˛\2                nnoremap <silent> <leader>u :call quickui#menu#open()<cr>\n                nnoremap <silent> <leader>U :call quickui#context#open(g:quickui_context_menu, { 'index': g:quickui#context#cursor })<cr>\n                vnoremap <silent> <leader>U :<c-u>call quickui#context#open(g:quickui_selection_context_menu, { 'index': g:quickui#context#cursor })<cr>\n            \bcmd\1\3\0\0$Telesc&ope Cheatsheet\t<leader>?\15Cheatsheet\1\3\0\0\27&Zeal Lookup\t<leader>z\vZeavim\1\2\0\0\a--\1\3\0\0\r&Summary\22help help-summary\1\3\0\0\21&Quick Reference\18help quickref\1\3\0\0\14&Tutorial\15help tutor\1\2\0\0\a--\1\3\0\0\nT&ips\14help tips\1\3\0\0\16&Cheatsheet\15help index\nH&elpjc,cpp,go,python,rust,sh,dapui_watches,dapui_stacks,dapui_breakpoints,dapui_scopes,dapui_repl,dap-repl\v<auto>\1\3\0\0\21R&EPL\t<leader>dr%lua require(\"dap\").repl.toggle()\1\2\0\0\a--\1\3\0\0\25Step Back\t<leader>dh#lua require(\"dap\").step_back()\1\3\0\0\25Step O&ut\t<leader>dO\"lua require(\"dap\").step_out()\1\3\0\0\26Step &Over\t<leader>do#lua require(\"dap\").step_over()\1\3\0\0\26Step &Into\t<leader>di#lua require(\"dap\").step_into()\1\2\0\0\a--\1\3\0\0*Set Conditional Breakpoint\t<leader>dcNlua require(\"dap\").set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))\1\3\0\0\31Set &Tracepoint\t<leader>dtVlua require(\"dap\").set_breakpoint(nil, nil, vim.fn.input(\"Tracepoint message: \"))\1\3\0\0\"Toggle &Breakpoint\t<leader>db+lua require(\"dap\").toggle_breakpoint()\1\2\0\0\a--\1\3\0\0\27&Disconnect\t<leader>ddTlua require(\"dap\").disconnect();require(\"dap\").close();require(\"dapui\").close()\1\3\0\0\22&Pause\t<leader>dp\31lua require(\"dap\").pause()\1\3\0\0\30&Run to Cursor\t<leader>dG'lua require(\"dap\").run_to_cursor()\1\3\0\0\25&Continue\t<leader>dg\"lua require(\"dap\").continue()\t&DAP\1\3\0\0\27&Translator\t<leader>cT CocCommand translator.popup\1\2\0\0\a--\1\3\0\0\21Git Hunk Next\t}h\21exec \"normal }h\"\1\3\0\0\25Git Hunk Previous\t{h\21exec \"normal {h\"\1\3\0\0\30Git Hunk &Undo\t<leader>hu\29CocCommand git.chunkUndo\1\3\0\0\31Git Hunk &Stage\t<leader>hs\30CocCommand git.chunkStage\1\3\0\0\30&Git Hunk Info\t<leader>hp\29CocCommand git.chunkInfo\1\3\0\0\27Git Co&mmit\t<leader>cC\30CocCommand git.showCommit\1\2\0\0\a--\1\3\0\0\26&Open Link\t<leader>co$call CocActionAsync(\"openLink\")\1\3\0\0\21Fo&ld\t<leader>cF call CocActionAsync(\"fold\")\1\3\0\0\31Outgoing Calls\t<leader>cco$call CocAction(\"outgoingCalls\")\1\3\0\0\31Incoming Calls\t<leader>cci$call CocAction(\"incomingCalls\")\1\3\0\0\25Refa&ctor\t<leader>cR$call CocActionAsync(\"refactor\")\1\3\0\0\23Re&name\t<leader>cn\"call CocActionAsync(\"rename\")\1\3\0\0\26&Highlight\t<leader>cH%call CocActionAsync(\"highlight\")\1\3\0\0\22Ho&ver\t<leader>ch#call CocActionAsync(\"doHover\")\1\3\0\0\23&Format\t<leader>cf\"call CocActionAsync(\"format\")\1\2\0\0\a--\1\3\0\0\31CodeLens Action\t<leader>cl*call CocActionAsync(\"codeLensAction\")\1\3\0\0&Code Action (Document)\t<leader>cA*call CocActionAsync(\"codeAction\", \"\")\1\3\0\0\23Code Action (Line).call CocActionAsync(\"codeAction\", \"line\")\1\3\0\0%Code &Action (Cursor)\t<leader>ca0call CocActionAsync(\"codeAction\", \"cursor\")\1\2\0\0\a--\1\3\0\0\26&Quick Fix\t<leader>cq&call CocActionAsync(\"doQuickfix\")\1\3\0\0\"Toggle Diagnostics\t<leader>cg,call CocActionAsync(\"diagnosticToggle\")\1\3\0\0\31Diagnostic Next\t<leader>c}*call CocActionAsync(\"diagnosticNext\")\1\3\0\0#Diagnostic Previous\t<leader>c{.call CocActionAsync(\"diagnosticPrevious\")\1\3\0\0\26Diagnostic\t<leader>cI*call CocActionAsync(\"diagnosticInfo\")\1\2\0\0\a--\1\3\0\0\22References (Used)$call CocActionAsync(\"jumpUsed\")\1\3\0\0\27&References\t<leader>cr*call CocActionAsync(\"jumpReferences\")\1\3\0\0&Go to T&ype Definition\t<leader>ct.call CocActionAsync(\"jumpTypeDefinition\")\1\3\0\0%Go to &Implementation\t<leader>ci.call CocActionAsync(\"jumpImplementation\")\1\3\0\0\"Go to D&eclaration\t<leader>cD+call CocActionAsync(\"jumpDeclaration\")\1\3\0\0!Go to &Definition\t<leader>cd*call CocActionAsync(\"jumpDefinition\")\t&Coc\1\3\0\0#DAP Configurations\t<leader>ods!Telescope dap configurations\1\3\0\0\29DAP Commands\t<leader>odc\27Telescope dap commands\1\3\0\0\27DAP Frames\t<leader>odf\25Telescope dap frames\1\3\0\0\30DAP Variables\t<leader>odv\28Telescope dap variables\1\3\0\0 DAP Breakpoints\t<leader>odb#Telescope dap list_breakpoints\1\2\0\0\a--\1\3\0\0'Coc Most Recently Used\t<leader>ocu\22Telescope coc mru\1\3\0\0\30Coc C&ommands\t<leader>occ\27Telescope coc commands\1\3\0\0)Coc Symbols (Works&pace)\t<leader>ocS$Telescope coc workspace_symbols\1\3\0\0(Coc Symbols (Doc&ument)\t<leader>ocs#Telescope coc document_symbols\1\3\0\0-Coc Diagnostics (&Workspace)\t<leader>ocE(Telescope coc workspace_diagnostics\1\3\0\0,Coc &Diagnostics (Document)\t<leader>oce\30Telescope coc diagnostics\1\3\0\0\26Coc Links\t<leader>oco\24Telescope coc links\1\3\0\0 Coc &References\t<leader>ocr\29Telescope coc references\1\3\0\0&Coc T&ype Definitions\t<leader>oct#Telescope coc type_definitions\1\3\0\0%Coc &Implementations\t<leader>oci\"Telescope coc implementations\1\3\0\0!Coc Declarations\t<leader>ocD\31Telescope coc declarations\1\3\0\0!Coc D&efinitions\t<leader>ocd\30Telescope coc definitions\1\3\0\0,Coc Code Actions (Document)\t<leader>ocA$Telescope coc file_code_actions\1\3\0\0\28Coc Code Actions (Line)$Telescope coc line_code_actions\1\3\0\0+Coc Code &Actions (Cursor)\t<leader>oca\31Telescope coc code_actions\1\2\0\0\a--\1\3\0\0\28Git Commits\t<leader>ogc\26Telescope git_commits\1\3\0\0\26Git Files\t<leader>ogf\24Telescope git_files\1\2\0\0\a--\1\3\0\0\25Cheatsheet\t<leader>?\15Cheatsheet\1\3\0\0\28Tree-&sitter\t<leader>oo\25Telescope treesitter\1\3\0\0\21&Grep\t<leader>og\24Telescope live_grep\1\3\0\0\18fd\t<leader>oF\17Telescope fd\1\3\0\0\27&Find files\t<leader>of\25Telescope find_files\1\3\0\0\24&Buffers\t<leader>ob\22Telescope buffers\1\3\0\0\21&Tags\t<leader>oT\19Telescope tags\1\3\0\0\27Buffer tags\t<leader>ot\"Telescope current_buffer_tags\1\3\0\0\30Lo&cation list\t<leader>ol\22Telescope loclist\1\3\0\0\25&QuickFix\t<leader>oq\23Telescope quickfix\1\3\0\0\22&Marks\t<leader>om\20Telescope marks\1\3\0\0\23Builti&n\t<leader>O\14Telescope\15&Telescope\1\3\0\0000Set &Cursor Line %{&cursorline? \"Off\":\"On\"}\20set cursorline!\1\3\0\0%Set &Spell %{&spell? \"Off\":\"On\"}\15set spell!\1\3\0\0/Set &Paste %{&paste? \"Off\":\"On\"}\t<leader>P\15set paste!\1\3\0\0\24Sayonar&a\t<leader>q\14Sayonara!\1\3\0\0\21Choose &Window\t-\14ChooseWin\1\3\0\0\28Quick &Run\t<leader><cr>\rQuickRun\1\3\0\0\31Toggle &Indentation Guides\26IndentBlanklineToggle\1\3\0\0\30Toggle &ZenMode\t<leader>M\fZenMode\1\3\0\0#Toggle &Maximization\t<leader>m\20MaximizerToggle\r&General\25quickui#menu#install\23quickui#menu#reset\afn\bvim\0" },
    keys = { { "n", "<leader>u" }, { "n", "<leader>U" }, { "v", "<leader>U" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-quickui",
    url = "https://github.com/skywind3000/vim-quickui",
    wants = { "coc.nvim", "telescope.nvim", "nvim-dap", "vim-maximizer", "zen-mode.nvim", "indent-blankline.nvim", "vim-quickrun", "vim-choosewin", "vim-sayonara" }
  },
  ["vim-ragtag"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-ragtag",
    url = "https://github.com/tpope/vim-ragtag"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rescript"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-rescript",
    url = "https://github.com/rescript-lang/vim-rescript"
  },
  ["vim-sayonara"] = {
    config = { "\27LJ\1\2N\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0/nnoremap <silent> <leader>q :Sayonara!<cr>\bcmd\bvim\0" },
    keys = { { "", "<leader>q" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-sayonara",
    url = "https://github.com/mhinz/vim-sayonara"
  },
  ["vim-slime"] = {
    commands = { "SlimeRegionSend", "SlimeParagraphSend" },
    config = { "\27LJ\1\2≥\b\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0ì\b                xmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = \"{left-of}\"'<cr><Plug>SlimeRegionSend\n                xmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = \"{down-of}\"'<cr><Plug>SlimeRegionSend\n                xmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = \"{up-of}\"'<cr><Plug>SlimeRegionSend\n                xmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = \"{right-of}\"'<cr><Plug>SlimeRegionSend\n                nmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = \"{left-of}\"'<cr><Plug>SlimeParagraphSend\n                nmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = \"{down-of}\"'<cr><Plug>SlimeParagraphSend\n                nmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = \"{up-of}\"'<cr><Plug>SlimeParagraphSend\n                nmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = \"{right-of}\"'<cr><Plug>SlimeParagraphSend\n            \bcmd\bvim\0" },
    keys = { { "", "<c-c>" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-slime",
    url = "https://github.com/oblitum/vim-slime"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-spacebars"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-spacebars",
    url = "https://github.com/Slava/vim-spacebars"
  },
  ["vim-stardict"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-stardict",
    url = "https://github.com/phongvcao/vim-stardict"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  vimtex = {
    loaded = true,
    needs_bufread = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["vista.vim"] = {
    config = { "\27LJ\1\2”\2\0\0\2\0\6\0\v4\0\0\0007\0\1\0004\1\0\0007\1\1\0017\1\3\1:\1\2\0004\0\0\0007\0\4\0%\1\5\0>\0\2\1G\0\1\0˙\1                nnoremap <silent> <leader>t :Vista!!<cr>\n\n                autocmd init BufEnter __vista__ set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline\n                autocmd init BufLeave __vista__ set guicursor&\n            \bcmd\14lsp_icons\25vista#renderer#icons\6g\bvim\0" },
    keys = { { "", "<leader>t" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["xterm-color-table.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/xterm-color-table.vim",
    url = "https://github.com/guns/xterm-color-table.vim"
  },
  yaifa = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/yaifa",
    url = "https://github.com/Raimondi/yaifa"
  },
  ["zeavim.vim"] = {
    commands = { "Zeavim", "ZeavimV" },
    keys = { { "", "<leader>z" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/zeavim.vim",
    url = "https://github.com/KabbAmine/zeavim.vim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\1\2L\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0-nnoremap <silent> <leader>M :ZenMode<cr>\bcmd\bvim\0" },
    keys = { { "", "<leader>M" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  },
  ["zenbones.nvim"] = {
    config = { "\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0" },
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  },
  ["zig.vim"] = {
    loaded = true,
    path = "/home/nikp123/.local/share/nvim/site/pack/packer/start/zig.vim",
    url = "https://github.com/ziglang/zig.vim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^dap%-python"] = "nvim-dap-python",
  ["^dapui"] = "nvim-dap-ui",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^plenary"] = "plenary.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: vim-obsession
time([[Setup for vim-obsession]], true)
vim.g.obsession_no_bufenter = 1
time([[Setup for vim-obsession]], false)
-- Setup for: editorconfig-vim
time([[Setup for editorconfig-vim]], true)
vim.g.EditorConfig_max_line_indicator = 'exceeding'
time([[Setup for editorconfig-vim]], false)
time([[packadd for editorconfig-vim]], true)
vim.cmd [[packadd editorconfig-vim]]
time([[packadd for editorconfig-vim]], false)
-- Setup for: vista.vim
time([[Setup for vista.vim]], true)
try_loadstring("\27LJ\1\2ô\2\0\0\3\0\v\1\0194\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0004\1\5\0007\1\6\0014\2\0\0007\2\a\0027\2\b\2\23\2\0\2>\1\2\2:\1\4\0004\0\0\0007\0\1\0003\1\n\0:\1\t\0G\0\1\0\1\0\t\bcss\bcoc\bcpp\bcoc\trust\bcoc\vpython\bcoc\15javascript\bcoc\6c\bcoc\ago\bcoc\15typescript\bcoc\thtml\bcoc\24vista_executive_for\fcolumns\6o\tmodf\tmath\24vista_sidebar_width\17floating_win\31vista_echo_cursor_strategy\6g\bvim\b\0", "setup", "vista.vim")
time([[Setup for vista.vim]], false)
-- Setup for: coc.nvim
time([[Setup for coc.nvim]], true)
try_loadstring("\27LJ\1\2£ \0\0\6\0™\1\0«\0014\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0%\1\a\0:\1\6\0004\0\0\0007\0\1\0003\1\t\0:\1\b\0004\0\0\0007\0\1\0%\1\v\0:\1\n\0004\0\0\0007\0\1\0%\1\r\0:\1\f\0004\0\0\0007\0\1\0003\1\24\0003\2\18\0003\3\15\0003\4\16\0:\4\17\3:\3\19\0023\3\21\0003\4\20\0:\4\22\3:\3\23\2:\2\25\0013\2\26\0004\3\0\0007\3\1\0037\3\27\3:\3\28\2:\2\29\0013\2\30\0:\2\31\0013\2 \0:\2!\0013\2\"\0003\3#\0:\3$\2:\2%\0013\2-\0003\3'\0003\4&\0:\4(\0033\4)\0:\4*\0033\4+\0:\4,\3:\3.\0023\0030\0003\4/\0:\0041\3:\0032\2:\0023\0013\0024\0:\0025\0013\0026\0003\0037\0:\0038\0023\0039\0:\3:\0023\3;\0:\3<\0023\3=\0:\3>\0023\3?\0:\3@\2:\2A\0013\2B\0003\3C\0:\3D\2:\2E\0013\2G\0003\3F\0:\3!\2:\2H\0013\2I\0:\2J\0013\2L\0003\3K\0:\3M\0023\3N\0:\3O\0023\3P\0:\3Q\2:\2R\0013\2T\0003\3S\0:\3U\2:\2V\0013\2X\0003\3W\0:\3Y\0023\3Z\0:\3[\0023\3\\\0:\3]\2:\2^\0013\2`\0003\3_\0:\3a\2:\2b\0013\2d\0003\3c\0:\3e\2:\2f\0013\2g\0:\2h\0013\2j\0003\3i\0:\3k\0023\3l\0003\4m\0:\4n\3:\3o\0023\3p\0003\4q\0:\4n\3:\3r\2:\2s\0013\2u\0003\3t\0:\3v\0023\3w\0:\3x\2:\2y\0013\2{\0003\3z\0:\3|\2:\2}\0013\2Å\0003\3\0003\4~\0:\4Ä\3:\3Ç\2:\2É\0013\2Ñ\0:\2Ö\0013\2Ü\0:\2á\0013\2â\0003\3à\0:\3ä\2:\2ã\0013\2è\0003\3å\0003\4ç\0:\4n\0033\4é\0:\4ä\3:\3ê\0023\3ë\0003\4í\0:\4n\0033\4ì\0:\4ä\0033\4î\0:\4ï\3:\3ñ\0023\3ó\0003\4ò\0:\4ô\0033\4ö\0:\4n\0033\4õ\0:\4ä\0033\4ú\0:\4ï\0033\4û\0003\5ù\0:\5ü\4:\4†\3:\3ü\0023\3°\0003\4¢\0:\4n\0033\4£\0:\4ä\0033\4§\0:\4ï\3:\3•\0023\3¶\0003\4ß\0:\4ä\3:\3®\2:\2©\1:\1\14\0G\0\1\0\19languageserver\bzig\1\2\0\0\bzig\1\0\1\fcommand\bzls\rrescript\1\2\0\0\18bsconfig.json\1\2\0\0\rrescript\1\2\0\0\15--node-ipc\1\0\2\vmoduleQ~/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js\venable\2\rsettings\15purescript\1\0\0\1\0\1\20addSpagoSources\2\1\4\0\0\15bower.json\21psc-package.json\16spago.dhall\1\2\0\0\15purescript\1\2\0\0\f--stdio\ntrace\1\0\1\vserver\boff\1\0\1\fcommand\31purescript-language-server\fhaskell\17rootPatterns\1\5\0\0\f*.cabal\15stack.yaml\18cabal.project\17package.yaml\1\3\0\0\fhaskell\rlhaskell\1\2\0\0\n--lsp\1\0\1\fcommand$haskell-language-server-wrapper\fgraphql\1\0\0\1\4\0\0\15typescript\20typescriptreact\fgraphql\1\4\0\0\vserver\a-m\vstream\1\0\1\fcommand\16graphql-lsp\30diagnostic-languageserver\14filetypes\1\0\0\1\0\1\bvim\tvint\rsqlfluff\1\0\1\17formatEnable\1\fwebview\1\0\1\16openCommand\29firefox -new-window \"%u\"\17markdownlint\vconfig\1\0\0\16line-length\1\0\0\1\0\1\27code_block_line_length\3\1\bxml\tjava\1\0\0\1\0\1\thome\25/usr/lib/jvm/default\tltex\20additionalRules\1\0\1\18languageModel\23~/Downloads/ngrams\fenabled\1\0\1\22completionEnabled\2\1\b\0\0\vbibtex\thtml\nlatex\rmarkdown\borg\21restructuredtext\frsweave\vtexlab\nbuild\1\5\0\0\a%f\14--synctex\16--keep-logs\25--keep-intermediates\1\0\1\15executable\rtectonic\18forwardSearch\targs\1\4\0\0\22--synctex-forward\f%l:1:%f\a%p\1\0\1\15executable\fzathura\vchktex\1\0\0\1\0\1\18onOpenAndSave\2\veslint\1\0\2\19packageManager\tyarn\nquiet\2\rtsserver\26implicitProjectConfig\1\0\0\1\0\1\fcheckJs\2\ago\17goplsOptions\1\0\0\1\0\1\20usePlaceholders\2\18rust-analyzer\15inlayHints\1\0\2\27chainingHintsSeparator\t‚ñ† \23typeHintsSeparator\t‚ñ† \16checkOnSave\1\0\1\fcommand\vclippy\18notifications\1\0\0\1\0\1\20workspaceLoaded\1\vclangd\14arguments\1\0\0\1\3\0\0\24--cross-file-rename --completion-style=detailed\bLua\thint\1\0\1\venable\1\15completion\1\0\1\16callSnippet\fReplace\14telemetry\1\0\0\1\0\1\venable\1\16sumneko-lua\1\0\1\21enableNvimLuaDev\2\vvimlsp\1\0\0\1\0\1\venable\1\15translator\fengines\1\2\0\0\vgoogle\1\0\1\vtoLang\apt\bgit\22changeRemovedSign\1\0\2\ttext\vÔëöÔ∏è\fhlGroup\19GitSignsDelete\19topRemovedSign\1\0\2\ttext\v‚ñîÔ∏è\fhlGroup\19GitSignsDelete\16changedSign\1\0\2\ttext\vÔëôÔ∏è\fhlGroup\19GitSignsChange\16removedSign\1\0\2\ttext\v‚ñÅÔ∏è\fhlGroup\19GitSignsDelete\14addedSign\1\0\2\ttext\vÔëóÔ∏è\fhlGroup\16GitSignsAdd\1\0\1\23enableGlobalStatus\1\rprettier\1\0\1\19statusItemText\fÔó°Ô∏è \rsnippets\14ultisnips\16directories\1\0\0\1\3\0\0\14UltiSnips\25gosnippets/UltiSnips\fextends\1\0\0\15typescript\1\2\0\0\15javascript\20javascriptreact\1\2\0\0\15javascript\bcpp\1\0\0\1\2\0\0\6c\14lightbulb\tonly\1\3\0\0\rquickfix$quickfix.ltex.acceptSuggestions\1\0\2\15statusText\vÔ†¥Ô∏è\16virtualText\vÔ†¥Ô∏è\15diagnostic\1\0\5\rinfoSign\vÔÅöÔ∏è\16warningSign\vÔÅ±Ô∏è\16autoRefresh\1\14errorSign\vÔãìÔ∏è\rhintSign\vÔØ¶Ô∏è\14signature\1\0\1\21preferShownAbove\1\fsuggest\29completionItemKindLabels\14lsp_icons\1\0\5\22defaultSortMethod\tnone\21snippetIndicator\r ÔÉêÔ∏è \17messageLevel\fwarning\20enablePreselect\2\rnoselect\1\bcoc\1\0\0\vsource\17tmuxcomplete\1\0\0\1\0\1\venable\1\16preferences\1\0\0\28semanticTokensFiletypes\1\2\0\0\6*\1\0\1\22snippetStatusText\fÔÉêÔ∏è \20coc_user_config\n<c-h>\21coc_snippet_prev\n<c-l>\21coc_snippet_next\1\0\1\vpandoc\rmarkdown\21coc_filetype_map\vÔÅ±Ô∏è\28coc_status_warning_sign\vÔãìÔ∏è\26coc_status_error_sign\1+\0\0\vcoc-db\vcoc-go\vcoc-sh\fcoc-css\fcoc-git\fcoc-svg\fcoc-xml\rcoc-html\rcoc-json\rcoc-ltex\rcoc-yaml\14coc-cmake\14coc-emmet\14coc-emoji\14coc-julia\14coc-lists\14coc-r-lsp\14coc-vetur\15coc-clangd\15coc-docker\15coc-eslint\15coc-kotlin\15coc-syntax\15coc-texlab\15coc-vimlsp\16coc-clojure\16coc-flutter\16coc-pyright\16coc-webview\17coc-prettier\17coc-snippets\17coc-sqlfluff\17coc-tsserver\18coc-lightbulb\19coc-diagnostic\19coc-translator\20coc-marketplace\20coc-sumneko-lua\21coc-markdownlint\22coc-rust-analyzer\26coc-styled-components\"coc-markdown-preview-enhanced\26coc_global_extensions\6g\bvim\0", "setup", "coc.nvim")
time([[Setup for coc.nvim]], false)
time([[packadd for coc.nvim]], true)
vim.cmd [[packadd coc.nvim]]
time([[packadd for coc.nvim]], false)
-- Setup for: pgsql.vim
time([[Setup for pgsql.vim]], true)
vim.g.sql_type_default = 'pgsql'
time([[Setup for pgsql.vim]], false)
time([[packadd for pgsql.vim]], true)
vim.cmd [[packadd pgsql.vim]]
time([[packadd for pgsql.vim]], false)
-- Setup for: rose-pine
time([[Setup for rose-pine]], true)
try_loadstring("\27LJ\1\2e\0\0\2\0\5\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0)\1\1\0:\1\4\0G\0\1\0!rose_pine_disable_background\tmoon\22rose_pine_variant\6g\bvim\0", "setup", "rose-pine")
time([[Setup for rose-pine]], false)
time([[packadd for rose-pine]], true)
vim.cmd [[packadd rose-pine]]
time([[packadd for rose-pine]], false)
-- Setup for: vim-matchup
time([[Setup for vim-matchup]], true)
try_loadstring("\27LJ\1\2z\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0003\1\4\0:\1\3\0G\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen matchup_matchparen_deferred\6g\bvim\0", "setup", "vim-matchup")
time([[Setup for vim-matchup]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
vim.g.user_emmet_leader_key = '<c-space>'
time([[Setup for emmet-vim]], false)
-- Setup for: vim-maximizer
time([[Setup for vim-maximizer]], true)
vim.g.maximizer_set_default_mapping = 0
time([[Setup for vim-maximizer]], false)
-- Setup for: vim-wordmotion
time([[Setup for vim-wordmotion]], true)
vim.g.wordmotion_prefix = '<leader>'
time([[Setup for vim-wordmotion]], false)
time([[packadd for vim-wordmotion]], true)
vim.cmd [[packadd vim-wordmotion]]
time([[packadd for vim-wordmotion]], false)
-- Setup for: translate-shell.vim
time([[Setup for translate-shell.vim]], true)
vim.g.trans_default_direction = ':pt'
time([[Setup for translate-shell.vim]], false)
-- Setup for: vim-mma
time([[Setup for vim-mma]], true)
vim.g.mma_candy = 1
time([[Setup for vim-mma]], false)
time([[packadd for vim-mma]], true)
vim.cmd [[packadd vim-mma]]
time([[packadd for vim-mma]], false)
-- Setup for: vim-better-whitespace
time([[Setup for vim-better-whitespace]], true)
try_loadstring("\27LJ\1\2æ\2\0\0\2\0\6\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0003\1\5\0:\1\4\0G\0\1\0\1\24\0\0\vpacker\rNvimTree\nvista\15vista_kind\fcoctree\tdbui\nMundo\14MundoDiff\18dapui_watches\17dapui_stacks\22dapui_breakpoints\17dapui_scopes\15dapui_repl\rdap-repl\thelp\5\aqf\tdiff\14gitcommit\tmail\rquickrun\tcodi\20TelescopePrompt*better_whitespace_filetypes_blacklist\5\31better_whitespace_operator\6g\bvim\0", "setup", "vim-better-whitespace")
time([[Setup for vim-better-whitespace]], false)
time([[packadd for vim-better-whitespace]], true)
vim.cmd [[packadd vim-better-whitespace]]
time([[packadd for vim-better-whitespace]], false)
-- Setup for: vim-floaterm
time([[Setup for vim-floaterm]], true)
try_loadstring("\27LJ\1\2‰\2\0\0\2\0\r\0\0254\0\0\0007\0\1\0'\1\5\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0%\1\6\0:\1\5\0004\0\0\0007\0\1\0%\1\b\0:\1\a\0004\0\0\0007\0\1\0%\1\n\0:\1\t\0004\0\0\0007\0\v\0%\1\f\0>\0\2\1G\0\1\0d                autocmd init VimEnter,ColorScheme * hi! link FloatermBorder Normal\n            \bcmd\14<leader>]\25floaterm_keymap_next\14<leader>[\25floaterm_keymap_prev\14<leader>f\27floaterm_keymap_toggle\14<leader>F\24floaterm_keymap_new\22floaterm_winblend\6g\bvim\0", "setup", "vim-floaterm")
time([[Setup for vim-floaterm]], false)
-- Setup for: vim-dadbod-ui
time([[Setup for vim-dadbod-ui]], true)
vim.g.db_ui_use_nerd_fonts = 1
time([[Setup for vim-dadbod-ui]], false)
time([[packadd for vim-dadbod-ui]], true)
vim.cmd [[packadd vim-dadbod-ui]]
time([[packadd for vim-dadbod-ui]], false)
-- Setup for: vim-slime
time([[Setup for vim-slime]], true)
try_loadstring("\27LJ\1\2≠\1\0\0\2\0\a\0\r4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0003\1\6\0:\1\5\0G\0\1\0\1\0\2\16socket_name\fdefault\16target_pane\15{right-of}\25slime_default_config\27slime_dont_ask_default\ttmux\17slime_target\6g\bvim\0", "setup", "vim-slime")
time([[Setup for vim-slime]], false)
-- Setup for: vimtex
time([[Setup for vimtex]], true)
try_loadstring("\27LJ\1\2c\0\0\2\0\4\0\t4\0\0\0007\0\1\0'\1\0\0:\1\2\0004\0\0\0007\0\1\0'\1\0\0:\1\3\0G\0\1\0\30vimtex_matchparen_enabled\28vimtex_complete_enabled\6g\bvim\0", "setup", "vimtex")
time([[Setup for vimtex]], false)
time([[packadd for vimtex]], true)
vim.cmd [[packadd vimtex]]
time([[packadd for vimtex]], false)
-- Setup for: vim-quickui
time([[Setup for vim-quickui]], true)
try_loadstring("\27LJ\1\2Ÿ\18\0\0\3\0,\0]4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\2\0:\1\3\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0002\1!\0003\2\a\0;\2\1\0013\2\b\0;\2\2\0013\2\t\0;\2\3\0013\2\n\0;\2\4\0013\2\v\0;\2\5\0013\2\f\0;\2\6\0013\2\r\0;\2\a\0013\2\14\0;\2\b\0013\2\15\0;\2\t\0013\2\16\0;\2\n\0013\2\17\0;\2\v\0013\2\18\0;\2\f\0013\2\19\0;\2\r\0013\2\20\0;\2\14\0013\2\21\0;\2\15\0013\2\22\0;\2\16\0013\2\23\0;\2\17\0013\2\24\0;\2\18\0013\2\25\0;\2\19\0013\2\26\0;\2\20\0013\2\27\0;\2\21\0013\2\28\0;\2\22\0013\2\29\0;\2\23\0013\2\30\0;\2\24\0013\2\31\0;\2\25\0013\2 \0;\2\26\0013\2!\0;\2\27\0013\2\"\0;\2\28\0013\2#\0;\2\29\0013\2$\0;\2\30\0013\2%\0;\2\31\0013\2&\0;\2 \1:\1\6\0004\0\0\0007\0\1\0002\1\5\0003\2(\0;\2\1\0013\2)\0;\2\2\0013\2*\0;\2\3\0013\2+\0;\2\4\1:\1'\0G\0\1\0\1\3\0\0\27&Zeal Lookup\t<leader>z\fZeavimV\1\2\0\0\a--\1\3\0\0\27Coc &Format\t<leader>cf8call CocActionAsync(\"formatSelected\", visualmode())\1\3\0\0 Coc Code &Action\t<leader>ca4call CocActionAsync(\"codeAction\", visualmode())#quickui_selection_context_menu\1\3\0\0\27&Zeal Lookup\t<leader>z\vZeavim\1\3\0\0\27&Translator\t<leader>cT CocCommand translator.popup\1\2\0\0\a--\1\3\0\0\30Git Hunk &Undo\t<leader>hu\29CocCommand git.chunkUndo\1\3\0\0\31Git Hunk &Stage\t<leader>hs\30CocCommand git.chunkStage\1\3\0\0\30&Git Hunk Info\t<leader>hp\29CocCommand git.chunkInfo\1\3\0\0\27Git Co&mmit\t<leader>cC\30CocCommand git.showCommit\1\2\0\0\a--\1\3\0\0\26&Open Link\t<leader>co$call CocActionAsync(\"openLink\")\1\3\0\0\21Fo&ld\t<leader>cF call CocActionAsync(\"fold\")\1\3\0\0\31Outgoing Calls\t<leader>cco$call CocAction(\"outgoingCalls\")\1\3\0\0\31Incoming Calls\t<leader>cci$call CocAction(\"incomingCalls\")\1\3\0\0\25Refa&ctor\t<leader>cR$call CocActionAsync(\"refactor\")\1\3\0\0\23Re&name\t<leader>cn\"call CocActionAsync(\"rename\")\1\3\0\0\26&Highlight\t<leader>cH%call CocActionAsync(\"highlight\")\1\3\0\0\22Ho&ver\t<leader>ch#call CocActionAsync(\"doHover\")\1\3\0\0\23&Format\t<leader>cf\"call CocActionAsync(\"format\")\1\2\0\0\a--\1\3\0\0\31CodeLens Action\t<leader>cl*call CocActionAsync(\"codeLensAction\")\1\3\0\0&Code Action (Document)\t<leader>cA*call CocActionAsync(\"codeAction\", \"\")\1\3\0\0\23Code Action (Line).call CocActionAsync(\"codeAction\", \"line\")\1\3\0\0%Code &Action (Cursor)\t<leader>ca0call CocActionAsync(\"codeAction\", \"cursor\")\1\2\0\0\a--\1\3\0\0\26&Quick Fix\t<leader>cq&call CocActionAsync(\"doQuickfix\")\1\3\0\0\26Diagnostic\t<leader>cI*call CocActionAsync(\"diagnosticInfo\")\1\2\0\0\a--\1\3\0\0\22References (Used)$call CocActionAsync(\"jumpUsed\")\1\3\0\0\27&References\t<leader>cr*call CocActionAsync(\"jumpReferences\")\1\3\0\0&Go to T&ype Definition\t<leader>ct.call CocActionAsync(\"jumpTypeDefinition\")\1\3\0\0%Go to &Implementation\t<leader>ci.call CocActionAsync(\"jumpImplementation\")\1\3\0\0\"Go to D&eclaration\t<leader>cD+call CocActionAsync(\"jumpDeclaration\")\1\3\0\0!Go to &Definition\t<leader>cd*call CocActionAsync(\"jumpDefinition\")\25quickui_context_menu\vsystem\25quickui_color_scheme\25quickui_border_style\21quickui_show_tip\6g\bvim\0", "setup", "vim-quickui")
time([[Setup for vim-quickui]], false)
-- Setup for: julia-vim
time([[Setup for julia-vim]], true)
vim.g.latex_to_unicode_tab = 'off'
time([[Setup for julia-vim]], false)
time([[packadd for julia-vim]], true)
vim.cmd [[packadd julia-vim]]
time([[packadd for julia-vim]], false)
-- Setup for: vim-quickrun
time([[Setup for vim-quickrun]], true)
try_loadstring("\27LJ\1\2¢\5\0\0\4\0\23\0\0274\0\0\0007\0\1\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0003\3\v\0:\3\f\0023\3\r\0:\3\14\2:\2\15\0013\2\16\0003\3\17\0:\3\f\2:\2\18\0013\2\19\0003\3\20\0:\3\f\0023\3\21\0:\3\14\2:\2\22\1:\1\2\0G\0\1\0\tdats\1\2\0\0\v%S:p:r\1\3\0\0\23%c %o %s -o %s:p:r\14%s:p:r %a\1\0\3\fcommand\vpatscc\rtempfile\23%{tempname()}.dats\vcmdopt\14-cleanaft\nocaml\1\3\0\0\22%c %o %s:t:r.byte\21./%s:t:r.byte %a\1\0\4\fcommand\14corebuild\22hook/cd/directory\v%S:p:h\rtempfile\21%{tempname()}.ml\vcmdopt\v-quiet\nswift\21hook/sweep/files\1\2\0\0\v%S:p:r\texec\1\3\0\0\23%c %o %s -o %s:p:r\14%s:p:r %a\1\0\2\fcommand\vswiftc\rtempfile\24%{tempname()}.swift\bcpp\1\0\2\fcommand\fclang++\vcmdopt5-O0 -Wall -Wextra -pedantic -std=c++20 -lpthread\6c\1\0\2\fcommand\nclang\vcmdopt -O0 -Wall -Wextra -lpthread\6_\1\0\0\1\0\1$outputter/buffer/close_on_empty\3\1\20quickrun_config\6g\bvim\0", "setup", "vim-quickrun")
time([[Setup for vim-quickrun]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2a\0\0\2\0\4\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0G\0\1\0\29nvim_tree_indent_markers\27nvim_tree_add_trailing\6g\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: vim-plugin-AnsiEsc
time([[Setup for vim-plugin-AnsiEsc]], true)
vim.g.no_cecutil_maps = 1
time([[Setup for vim-plugin-AnsiEsc]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2Á\1\0\0\4\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0003\3\5\0:\3\6\2:\2\a\0013\2\b\0003\3\t\0:\3\n\2:\2\v\1>\0\2\1G\0\1\0\17textsubjects\fkeymaps\1\0\1\6.\23textsubjects-smart\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\nlatex\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require('neoscroll').setup{}
time([[Config for neoscroll.nvim]], false)
-- Config for: zenbones.nvim
time([[Config for zenbones.nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "config", "zenbones.nvim")
time([[Config for zenbones.nvim]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\1\2ı'\0\0\6\0\f\0\0224\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0%\2\4\0%\3\5\0%\4\6\0%\5\a\0$\1\5\1>\0\2\0014\0\0\0007\0\1\0%\1\b\0%\2\t\0%\3\n\0%\4\v\0$\1\4\1>\0\2\1G\0\1\0Q  nnoremap <buffer><silent> <leader>cz :CocCommand latex.ForwardSearch<cr>  Q  nnoremap <buffer><silent> <leader>cB :CocCommand latex.BuildCancel<cr>   |Q  nnoremap <buffer><silent> <leader>cb :CocCommand latex.Build<cr>         |Qautocmd init FileType tex                                                   Ç\1  exec printf('hi CocHintHighlight    gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocHintSign'   , v:true).foreground)  Ç\1  exec printf('hi CocInfoHighlight    gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocInfoSign'   , v:true).foreground) |Ç\1  exec printf('hi CocWarningHighlight gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocWarningSign', v:true).foreground) |Ç\1  exec printf('hi CocErrorHighlight   gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocErrorSign'  , v:true).foreground) |Ç\1autocmd init VimEnter,ColorScheme *                                                                                          ‚\31                nmap     <silent>       <leader>cf <Plug>(coc-format)\n                vmap     <silent>       <leader>cf <Plug>(coc-format-selected)\n                nmap     <silent>       <leader>cA <Plug>(coc-codeaction)\n                nmap     <silent>       <leader>ca <Plug>(coc-codeaction-cursor)\n                vmap     <silent>       <leader>ca <Plug>(coc-codeaction-selected)\n                nmap     <silent>       <leader>cl <Plug>(coc-codelens-action)\n                nmap     <silent>       <leader>cI <Plug>(coc-diagnostic-info)\n                nmap     <silent>       <leader>c[ <Plug>(coc-diagnostic-prev)\n                nmap     <silent>       <leader>c] <Plug>(coc-diagnostic-next)\n                nmap     <silent>       <leader>cg :call CocAction('diagnosticToggle')<cr>\n                nmap     <silent>       <leader>cd <Plug>(coc-definition)\n                nmap     <silent>       <leader>cD <Plug>(coc-declaration)\n                nmap     <silent>       <leader>ci <Plug>(coc-implementation)\n                nmap     <silent>       <leader>ct <Plug>(coc-type-definition)\n                nmap     <silent>       <leader>cn <Plug>(coc-rename)\n                nmap     <silent>       <leader>cr <Plug>(coc-references)\n                nmap     <silent>       <leader>cu <Plug>(coc-references-used)\n                nmap     <silent>       <leader>cR <Plug>(coc-refactor)\n                nmap     <silent>       <leader>co <Plug>(coc-openlink)\n                nmap     <silent>       <leader>cq <Plug>(coc-fix-current)\n                nmap     <silent>       <leader>cC <Plug>(coc-git-commit)\n                nmap     <silent>               [h <Plug>(coc-git-prevchunk)\n                nmap     <silent>               ]h <Plug>(coc-git-nextchunk)\n                nmap     <silent>       <leader>hp <Plug>(coc-git-chunkinfo)\n                nnoremap <silent>       <leader>hu :CocCommand git.chunkUndo<cr>\n                nnoremap <silent>       <leader>hs :CocCommand git.chunkStage<cr>\n                nmap                    <leader>cT <Plug>(coc-translator-p)\n                nnoremap <silent>       <leader>ch :call CocActionAsync('doHover')<cr>\n                vnoremap <silent>       <leader>ch <cmd>call CocActionAsync('doHover')<cr>\n                nnoremap <silent>       <leader>cH :call CocActionAsync('highlight')<cr>\n                nnoremap <silent>      <leader>cci :call CocAction('incomingCalls')<cr>\n                nnoremap <silent>      <leader>cco :call CocAction('outgoingCalls')<cr>\n                inoremap <silent>       <c-space>s <cmd>call CocActionAsync('showSignatureHelp')<cr>\n                nnoremap <silent><expr>      <c-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : \":lua require('tmux').move_bottom()<cr>\"\n                nnoremap <silent><expr>      <c-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : \":lua require('tmux').move_top()<cr>\"\n                inoremap <silent><expr>      <c-j> coc#float#has_scroll() ? \"\\<c-r>=coc#float#scroll(1, 1)\\<cr>\" : \"\\<c-j>\"\n                inoremap <silent><expr>      <c-k> coc#float#has_scroll() ? \"\\<c-r>=coc#float#scroll(0, 1)\\<cr>\" : \"\\<c-k>\"\n                vnoremap <silent><expr>      <c-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : \"\\<c-j>\"\n                vnoremap <silent><expr>      <c-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : \"\\<c-k>\"\n                inoremap <silent><expr>      <c-y> pumvisible() ? coc#_select_confirm() : \"\\<c-y>\"\n                inoremap <silent><expr> <c-space>r coc#refresh()\n                nnoremap <silent>       <leader>cF :call CocActionAsync('fold')<cr>\n\n                inoremap <silent><expr>       <cr> pumvisible() ? \"\\<c-e>\\<cr>\" : \"\\<cr>\"\n\n                autocmd init CursorHold * call CocActionAsync('diagnosticRefresh')\n                autocmd init CompleteChanged * call coc#float#close_all()\n                autocmd init User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')\n                autocmd init VimEnter,ColorScheme * hi! link CocFloating Pmenu\n            \bcmd\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: vim-dadbod-ui
time([[Config for vim-dadbod-ui]], true)
try_loadstring("\27LJ\1\2ù\2\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0˝\1                autocmd init FileType dbout DisableWhitespace\n                autocmd init BufEnter,WinEnter dbui set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline\n                autocmd init WinLeave dbui set guicursor&\n            \bcmd\bvim\0", "config", "vim-dadbod-ui")
time([[Config for vim-dadbod-ui]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\1\2£\n\0\0\3\0\t\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\0014\0\6\0007\0\a\0%\1\b\0>\0\2\1G\0\1\0±\t                nnoremap <silent> <c-h> :lua require('tmux').move_left()<cr>\n                nnoremap <silent> <c-l> :lua require('tmux').move_right()<cr>\n\n                tnoremap <silent> <c-h> <c-\\><c-n>:lua require('tmux').move_left()<cr>\n                tnoremap <silent> <c-j> <c-\\><c-n>:lua require('tmux').move_bottom()<cr>\n                tnoremap <silent> <c-k> <c-\\><c-n>:lua require('tmux').move_top()<cr>\n                tnoremap <silent> <c-l> <c-\\><c-n>:lua require('tmux').move_right()<cr>\n\n                nnoremap <silent> <m-h> :lua require('tmux').resize_left()<cr>\n                nnoremap <silent> <m-j> :lua require('tmux').resize_bottom()<cr>\n                nnoremap <silent> <m-k> :lua require('tmux').resize_top()<cr>\n                nnoremap <silent> <m-l> :lua require('tmux').resize_right()<cr>\n\n                tnoremap <silent> <m-h> <c-\\><c-n>:lua require('tmux').resize_left()<cr>\n                tnoremap <silent> <m-j> <c-\\><c-n>:lua require('tmux').resize_bottom()<cr>\n                tnoremap <silent> <m-k> <c-\\><c-n>:lua require('tmux').resize_top()<cr>\n                tnoremap <silent> <m-l> <c-\\><c-n>:lua require('tmux').resize_right()<cr>\n            \bcmd\bvim\15navigation\1\0\0\1\0\1\17persist_zoom\2\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require('todo-comments').setup{}
time([[Config for todo-comments.nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\26colorscheme rose-pine\bcmd\bvim\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2Î\2\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\21filetype_exclude\1\23\0\0\vpacker\rNvimTree\nvista\15vista_kind\fcoctree\tdbui\nMundo\14MundoDiff\18dapui_watches\17dapui_stacks\22dapui_breakpoints\17dapui_scopes\15dapui_repl\rdap-repl\thelp\5\vpython\fhaskell\rlhaskell\15purescript\rmarkdown\vpandoc\20buftype_exclude\1\2\0\0\rterminal\1\0\2\25show_current_context\2\tchar\bÓò°\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SlimeParagraphSend lua require("packer.load")({'vim-slime'}, { cmd = "SlimeParagraphSend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Obsession lua require("packer.load")({'vim-obsession'}, { cmd = "Obsession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZeavimV lua require("packer.load")({'zeavim.vim'}, { cmd = "ZeavimV", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SlimeRegionSend lua require("packer.load")({'vim-slime'}, { cmd = "SlimeRegionSend", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cheatsheet lua require("packer.load")({'cheatsheet.nvim'}, { cmd = "Cheatsheet", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Zeavim lua require("packer.load")({'zeavim.vim'}, { cmd = "Zeavim", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TwilightEnable lua require("packer.load")({'twilight.nvim'}, { cmd = "TwilightEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vfix lua require("packer.load")({'vfix'}, { cmd = "Vfix", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>RestNvimPreview <cmd>lua require("packer.load")({'rest.nvim'}, { keys = "<lt>Plug>RestNvimPreview", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>f <cmd>lua require("packer.load")({'vim-floaterm'}, { keys = "<lt>leader>f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-c> <cmd>lua require("packer.load")({'vim-slime'}, { keys = "<lt>c-c>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>O <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>O", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader><cr> <cmd>lua require("packer.load")({'vim-quickrun'}, { keys = "<lt>leader><lt>cr>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>F <cmd>lua require("packer.load")({'vim-floaterm'}, { keys = "<lt>leader>F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>t <cmd>lua require("packer.load")({'vista.vim'}, { keys = "<lt>leader>t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>U <cmd>lua require("packer.load")({'vim-quickui'}, { keys = "<lt>leader>U", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>u <cmd>lua require("packer.load")({'vim-quickui'}, { keys = "<lt>leader>u", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>m <cmd>lua require("packer.load")({'vim-maximizer'}, { keys = "<lt>leader>m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>M <cmd>lua require("packer.load")({'zen-mode.nvim'}, { keys = "<lt>leader>M", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>L <cmd>lua require("packer.load")({'lens.vim'}, { keys = "<lt>leader>L", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>k <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>k", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <leader>U <cmd>lua require("packer.load")({'vim-quickui'}, { keys = "<lt>leader>U", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>H <cmd>lua require("packer.load")({'hop.nvim'}, { keys = "<lt>leader>H", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>q <cmd>lua require("packer.load")({'vim-sayonara'}, { keys = "<lt>leader>q", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-space> <cmd>lua require("packer.load")({'emmet-vim'}, { keys = "<lt>c-space>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>RestNvim <cmd>lua require("packer.load")({'rest.nvim'}, { keys = "<lt>Plug>RestNvim", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>d <cmd>lua require("packer.load")({'nvim-dap'}, { keys = "<lt>leader>d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> - <cmd>lua require("packer.load")({'vim-choosewin'}, { keys = "-", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>? <cmd>lua require("packer.load")({'cheatsheet.nvim'}, { keys = "<lt>leader>?", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>o <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>o", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>z <cmd>lua require("packer.load")({'zeavim.vim'}, { keys = "<lt>leader>z", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup', 'lualine.nvim'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
