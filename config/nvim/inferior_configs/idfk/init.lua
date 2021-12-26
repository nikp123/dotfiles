-- packer ❴
-- download ❴
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.glob(install_path) == '' then
    vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
end
-- ❵
vim.cmd [[packadd packer.nvim]]
require('packer').startup {{
    -- prelude ❴
    { 'wbthomason/packer.nvim', opt = true },
    { 'lewis6991/impatient.nvim', rocks = 'mpack' },
    { 'nvim-lua/plenary.nvim', module = 'plenary' },
    { 'kyazdani42/nvim-web-devicons', module = 'nvim-web-devicons' },
    -- ❵
    -- colorscheme ❴
    'folke/lsp-colors.nvim',
    {
        'rose-pine/neovim', as = 'rose-pine',
        setup = function()
            vim.g.rose_pine_variant = 'moon'
            vim.g.rose_pine_disable_background = false
        end,
        config = function()
            vim.cmd [[colorscheme rose-pine]]
        end
    },
    {
        'mcchrish/zenbones.nvim',
        requires = 'rktjmp/lush.nvim',
        config = function()
            -- vim.cmd [[colorscheme zenbones]]
        end
    },
    -- ❵
    -- highlighting ❴
    { 'inkarkat/SyntaxAttr.vim', opt = true },
    { 'guns/xterm-color-table.vim', opt = true },
    {
        'powerman/vim-plugin-AnsiEsc', opt = true,
        setup = [[vim.g.no_cecutil_maps = 1]]
    },
    {
        'folke/todo-comments.nvim',
        wants = 'plenary.nvim',
        config = [[require('todo-comments').setup{}]]
    },
    {
        'nvim-treesitter/nvim-treesitter',
        requires = 'RRethy/nvim-treesitter-textsubjects',
        branch = '0.5-compat',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = 'maintained',
                highlight = {
                    enable = true,
                    disable = { 'latex' }
                },
                textsubjects = {
                    enable = true,
                    keymaps = { ['.'] = 'textsubjects-smart' }
                }
            }
        end
    },
    {
        'andymass/vim-matchup', event = 'CursorMoved',
        setup = function()
            vim.g.matchup_matchparen_deferred = 1
            vim.g.matchup_matchparen_offscreen = { method = 'popup' }
        end
    },
    {
        'ntpeters/vim-better-whitespace',
        setup = function()
            vim.g.better_whitespace_operator = ''
            vim.g.better_whitespace_filetypes_blacklist = {
                'packer', 'NvimTree', 'vista', 'vista_kind', 'coctree', 'dbui',
                'Mundo', 'MundoDiff', 'dapui_watches', 'dapui_stacks',
                'dapui_breakpoints', 'dapui_scopes', 'dapui_repl', 'dap-repl',
                'help', '', 'qf', 'diff', 'gitcommit', 'mail', 'quickrun',
                'codi', 'TelescopePrompt'
            }
        end
    },
    -- ❵
    -- interface ❴
    'pgdouyon/vim-evanesco',
    {
        'folke/twilight.nvim',
        cmd = {
            'Twilight',
            'TwilightEnable'
        },
        config = [[require('twilight').setup{}]]
    },
    {
        'camspiers/lens.vim', keys = '<leader>L',
        requires = { { 'camspiers/animate.vim', opt = true } },
        wants = 'animate.vim',
        config = function()
            vim.cmd [[
                let g:lens#disabled = 1
                nnoremap <silent> <leader>L :call lens#run()<cr>
            ]]
        end
    },
    {
        'mhinz/vim-sayonara', keys = '<leader>q',
        config = function()
            vim.cmd [[nnoremap <silent> <leader>q :Sayonara!<cr>]]
        end
    },
    {
        'voldikss/vim-floaterm',
        keys = {
            { 'n', '<leader>F' },
            { 'n', '<leader>f' }
        },
        setup = function()
            vim.g.floaterm_winblend      = 5
            vim.g.floaterm_keymap_new    = '<leader>F'
            vim.g.floaterm_keymap_toggle = '<leader>f'
            vim.g.floaterm_keymap_prev   = '<leader>['
            vim.g.floaterm_keymap_next   = '<leader>]'

            vim.cmd [[
                autocmd init VimEnter,ColorScheme * hi! link FloatermBorder Normal
            ]]
        end
    },
    {
        'folke/zen-mode.nvim', cmd = 'ZenMode', keys = '<leader>M',
        config = function()
            vim.cmd [[nnoremap <silent> <leader>M :ZenMode<cr>]]
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                char = '',
                show_current_context = true,
                buftype_exclude = { 'terminal' },
                filetype_exclude = {
                    'packer', 'NvimTree', 'vista', 'vista_kind', 'coctree', 'dbui',
                    'Mundo', 'MundoDiff', 'dapui_watches', 'dapui_stacks',
                    'dapui_breakpoints', 'dapui_scopes', 'dapui_repl', 'dap-repl',
                    'help', '', 'python', 'haskell', 'lhaskell', 'purescript',
                    'markdown', 'pandoc'
                }
            }
        end
    },
    {
        'szw/vim-maximizer', keys = '<leader>m',
        setup = [[vim.g.maximizer_set_default_mapping = 0]],
        config = function()
            vim.cmd [[nnoremap <silent> <leader>m :MaximizerToggle!<cr>]]
        end
    },
    {
        'nvim-lualine/lualine.nvim', event = 'CursorMoved',
        requires = 'kyazdani42/nvim-web-devicons',
        after = 'coc.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'auto',
                    disabled_filetypes = {
                        'packer', 'NvimTree', 'vista', 'vista_kind', 'coctree',
                        'dbui', 'Mundo', 'MundoDiff', 'dapui_watches',
                        'dapui_stacks', 'dapui_breakpoints', 'dapui_scopes',
                        'dapui_repl', 'dap-repl'
                    }
                },
                sections = {
                    lualine_b = { 'branch' },
                    lualine_x = {
                        'g:coc_status',
                        {
                            'diagnostics',
                            sources = { 'coc' },
                            symbols = {
                                error = vim.g.coc_user_config.diagnostic.errorSign..' ',
                                warn  = vim.g.coc_user_config.diagnostic.warningSign..' ',
                                info  = vim.g.coc_user_config.diagnostic.infoSign..' ',
                                hint  = vim.g.coc_user_config.diagnostic.hintSign..' '
                            },
                            diagnostics_color = {
                                error = { fg = string.format("#%06x", vim.api.nvim_get_hl_by_name('CocErrorSign', true).foreground) },
                                warn  = { fg = string.format("#%06x", vim.api.nvim_get_hl_by_name('CocWarningSign', true).foreground) },
                                info  = { fg = string.format("#%06x", vim.api.nvim_get_hl_by_name('CocInfoSign', true).foreground) },
                                hint  = { fg = string.format("#%06x", vim.api.nvim_get_hl_by_name('CocHintSign', true).foreground) }
                            }
                        },
                        'encoding', 'fileformat', 'filetype'
                    }
                }
            }
        end
    },
    {
        'skywind3000/vim-quickui',
        keys = {
            { 'n', '<leader>u' },
            { 'n', '<leader>U' },
            { 'v', '<leader>U' }
        },
        wants = {
            'coc.nvim', 'telescope.nvim', 'nvim-dap', 'vim-maximizer',
            'zen-mode.nvim', 'indent-blankline.nvim', 'vim-quickrun',
            'vim-choosewin', 'vim-sayonara'
        },
        setup = function()
            vim.g.quickui_show_tip     = 1
            vim.g.quickui_border_style = 2
            vim.g.quickui_color_scheme = 'system'
            vim.g.quickui_context_menu = {
                { 'Go to &Definition\t<leader>cd'      , 'call CocActionAsync("jumpDefinition")'     },
                { 'Go to D&eclaration\t<leader>cD'     , 'call CocActionAsync("jumpDeclaration")'    },
                { 'Go to &Implementation\t<leader>ci'  , 'call CocActionAsync("jumpImplementation")' },
                { 'Go to T&ype Definition\t<leader>ct' , 'call CocActionAsync("jumpTypeDefinition")' },
                { '&References\t<leader>cr'            , 'call CocActionAsync("jumpReferences")'     },
                { 'References (Used)'                  , 'call CocActionAsync("jumpUsed")'           },
                { '--' },
                { 'Diagnostic\t<leader>cI' , 'call CocActionAsync("diagnosticInfo")' },
                { '&Quick Fix\t<leader>cq' , 'call CocActionAsync("doQuickfix")'     },
                { '--' },
                { 'Code &Action (Cursor)\t<leader>ca'  , 'call CocActionAsync("codeAction", "cursor")' },
                { 'Code Action (Line)'                 , 'call CocActionAsync("codeAction", "line")'   },
                { 'Code Action (Document)\t<leader>cA' , 'call CocActionAsync("codeAction", "")'       },
                { 'CodeLens Action\t<leader>cl'        , 'call CocActionAsync("codeLensAction")'       },
                { '--' },
                { '&Format\t<leader>cf'         , 'call CocActionAsync("format")'    },
                { 'Ho&ver\t<leader>ch'          , 'call CocActionAsync("doHover")'   },
                { '&Highlight\t<leader>cH'      , 'call CocActionAsync("highlight")' },
                { 'Re&name\t<leader>cn'         , 'call CocActionAsync("rename")'    },
                { 'Refa&ctor\t<leader>cR'       , 'call CocActionAsync("refactor")'  },
                { 'Incoming Calls\t<leader>cci' , 'call CocAction("incomingCalls")'  },
                { 'Outgoing Calls\t<leader>cco' , 'call CocAction("outgoingCalls")'  },
                { 'Fo&ld\t<leader>cF'           , 'call CocActionAsync("fold")'      },
                { '&Open Link\t<leader>co'      , 'call CocActionAsync("openLink")'  },
                { '--' },
                { 'Git Co&mmit\t<leader>cC'     , 'CocCommand git.showCommit' },
                { '&Git Hunk Info\t<leader>hp'  , 'CocCommand git.chunkInfo'  },
                { 'Git Hunk &Stage\t<leader>hs' , 'CocCommand git.chunkStage' },
                { 'Git Hunk &Undo\t<leader>hu'  , 'CocCommand git.chunkUndo'  },
                { '--' },
                { '&Translator\t<leader>cT' , 'CocCommand translator.popup' },
                { '&Zeal Lookup\t<leader>z' , 'Zeavim'                      }
            }
            vim.g.quickui_selection_context_menu = {
                { 'Coc Code &Action\t<leader>ca' , 'call CocActionAsync("codeAction", visualmode())'     },
                { 'Coc &Format\t<leader>cf'      , 'call CocActionAsync("formatSelected", visualmode())' },
                { '--' },
                { '&Zeal Lookup\t<leader>z' , 'ZeavimV' }
            }
        end,
        config = function()
            vim.fn['quickui#menu#reset']()

            vim.fn['quickui#menu#install']('&General', {
                { 'Toggle &Maximization\t<leader>m'             , 'MaximizerToggle'       },
                { 'Toggle &ZenMode\t<leader>M'                  , 'ZenMode'               },
                { 'Toggle &Indentation Guides'                  , 'IndentBlanklineToggle' },
                { 'Quick &Run\t<leader><cr>'                    , 'QuickRun'              },
                { 'Choose &Window\t-'                           , 'ChooseWin'             },
                { 'Sayonar&a\t<leader>q'                        , 'Sayonara!'             },
                { 'Set &Paste %{&paste? "Off":"On"}\t<leader>P' , 'set paste!'            },
                { 'Set &Spell %{&spell? "Off":"On"}'            , 'set spell!'            },
                { 'Set &Cursor Line %{&cursorline? "Off":"On"}' , 'set cursorline!'       }
            })

            vim.fn['quickui#menu#install']('&Telescope', {
                { 'Builti&n\t<leader>O'        , 'Telescope'                     },
                { '&Marks\t<leader>om'         , 'Telescope marks'               },
                { '&QuickFix\t<leader>oq'      , 'Telescope quickfix'            },
                { 'Lo&cation list\t<leader>ol' , 'Telescope loclist'             },
                { 'Buffer tags\t<leader>ot'    , 'Telescope current_buffer_tags' },
                { '&Tags\t<leader>oT'          , 'Telescope tags'                },
                { '&Buffers\t<leader>ob'       , 'Telescope buffers'             },
                { '&Find files\t<leader>of'    , 'Telescope find_files'          },
                { 'fd\t<leader>oF'             , 'Telescope fd'                  },
                { '&Grep\t<leader>og'          , 'Telescope live_grep'           },
                { 'Tree-&sitter\t<leader>oo'   , 'Telescope treesitter'          },
                { 'Cheatsheet\t<leader>?'      , 'Cheatsheet'                    },
                { '--' },
                { 'Git Files\t<leader>ogf'   , 'Telescope git_files'   },
                { 'Git Commits\t<leader>ogc' , 'Telescope git_commits' },
                { '--' },
                { 'Coc Code &Actions (Cursor)\t<leader>oca'   , 'Telescope coc code_actions'          },
                { 'Coc Code Actions (Line)'                   , 'Telescope coc line_code_actions'     },
                { 'Coc Code Actions (Document)\t<leader>ocA'  , 'Telescope coc file_code_actions'     },
                { 'Coc D&efinitions\t<leader>ocd'             , 'Telescope coc definitions'           },
                { 'Coc Declarations\t<leader>ocD'             , 'Telescope coc declarations'          },
                { 'Coc &Implementations\t<leader>oci'         , 'Telescope coc implementations'       },
                { 'Coc T&ype Definitions\t<leader>oct'        , 'Telescope coc type_definitions'      },
                { 'Coc &References\t<leader>ocr'              , 'Telescope coc references'            },
                { 'Coc Links\t<leader>oco'                    , 'Telescope coc links'                 },
                { 'Coc &Diagnostics (Document)\t<leader>oce'  , 'Telescope coc diagnostics'           },
                { 'Coc Diagnostics (&Workspace)\t<leader>ocE' , 'Telescope coc workspace_diagnostics' },
                { 'Coc Symbols (Doc&ument)\t<leader>ocs'      , 'Telescope coc document_symbols'      },
                { 'Coc Symbols (Works&pace)\t<leader>ocS'     , 'Telescope coc workspace_symbols'     },
                { 'Coc C&ommands\t<leader>occ'                , 'Telescope coc commands'              },
                { 'Coc Most Recently Used\t<leader>ocu'       , 'Telescope coc mru'                   },
                { '--' },
                { 'DAP Breakpoints\t<leader>odb'    , 'Telescope dap list_breakpoints' },
                { 'DAP Variables\t<leader>odv'      , 'Telescope dap variables'        },
                { 'DAP Frames\t<leader>odf'         , 'Telescope dap frames'           },
                { 'DAP Commands\t<leader>odc'       , 'Telescope dap commands'         },
                { 'DAP Configurations\t<leader>ods' , 'Telescope dap configurations'   }
            })

            vim.fn['quickui#menu#install']('&Coc', {
                { 'Go to &Definition\t<leader>cd'      , 'call CocActionAsync("jumpDefinition")'     },
                { 'Go to D&eclaration\t<leader>cD'     , 'call CocActionAsync("jumpDeclaration")'    },
                { 'Go to &Implementation\t<leader>ci'  , 'call CocActionAsync("jumpImplementation")' },
                { 'Go to T&ype Definition\t<leader>ct' , 'call CocActionAsync("jumpTypeDefinition")' },
                { '&References\t<leader>cr'            , 'call CocActionAsync("jumpReferences")'     },
                { 'References (Used)'                  , 'call CocActionAsync("jumpUsed")'           },
                { '--' },
                { 'Diagnostic\t<leader>cI'          , 'call CocActionAsync("diagnosticInfo")'     },
                { 'Diagnostic Previous\t<leader>c{' , 'call CocActionAsync("diagnosticPrevious")' },
                { 'Diagnostic Next\t<leader>c}'     , 'call CocActionAsync("diagnosticNext")'     },
                { 'Toggle Diagnostics\t<leader>cg'  , 'call CocActionAsync("diagnosticToggle")'   },
                { '&Quick Fix\t<leader>cq'          , 'call CocActionAsync("doQuickfix")'         },
                { '--' },
                { 'Code &Action (Cursor)\t<leader>ca'  , 'call CocActionAsync("codeAction", "cursor")' },
                { 'Code Action (Line)'                 , 'call CocActionAsync("codeAction", "line")'   },
                { 'Code Action (Document)\t<leader>cA' , 'call CocActionAsync("codeAction", "")'       },
                { 'CodeLens Action\t<leader>cl'        , 'call CocActionAsync("codeLensAction")'       },
                { '--' },
                { '&Format\t<leader>cf'         , 'call CocActionAsync("format")'    },
                { 'Ho&ver\t<leader>ch'          , 'call CocActionAsync("doHover")'   },
                { '&Highlight\t<leader>cH'      , 'call CocActionAsync("highlight")' },
                { 'Re&name\t<leader>cn'         , 'call CocActionAsync("rename")'    },
                { 'Refa&ctor\t<leader>cR'       , 'call CocActionAsync("refactor")'  },
                { 'Incoming Calls\t<leader>cci' , 'call CocAction("incomingCalls")'  },
                { 'Outgoing Calls\t<leader>cco' , 'call CocAction("outgoingCalls")'  },
                { 'Fo&ld\t<leader>cF'           , 'call CocActionAsync("fold")'      },
                { '&Open Link\t<leader>co'      , 'call CocActionAsync("openLink")'  },
                { '--' },
                { 'Git Co&mmit\t<leader>cC'     , 'CocCommand git.showCommit' },
                { '&Git Hunk Info\t<leader>hp'  , 'CocCommand git.chunkInfo'  },
                { 'Git Hunk &Stage\t<leader>hs' , 'CocCommand git.chunkStage' },
                { 'Git Hunk &Undo\t<leader>hu'  , 'CocCommand git.chunkUndo'  },
                { 'Git Hunk Previous\t{h'       , 'exec "normal {h"'          },
                { 'Git Hunk Next\t}h'           , 'exec "normal }h"'          },
                { '--' },
                { '&Translator\t<leader>cT' , 'CocCommand translator.popup' }
            })

            vim.fn['quickui#menu#install']('&DAP', {
                { '&Continue\t<leader>dg'      , 'lua require("dap").continue()'      },
                { '&Run to Cursor\t<leader>dG' , 'lua require("dap").run_to_cursor()' },
                { '&Pause\t<leader>dp'         , 'lua require("dap").pause()'         },
                { '&Disconnect\t<leader>dd'    , 'lua require("dap").disconnect();require("dap").close();require("dapui").close()' },
                { '--' },
                { 'Toggle &Breakpoint\t<leader>db'         , 'lua require("dap").toggle_breakpoint()'                                            },
                { 'Set &Tracepoint\t<leader>dt'            , 'lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Tracepoint message: "))' },
                { 'Set Conditional Breakpoint\t<leader>dc' , 'lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))'         },
                { '--' },
                { 'Step &Into\t<leader>di' , 'lua require("dap").step_into()' },
                { 'Step &Over\t<leader>do' , 'lua require("dap").step_over()' },
                { 'Step O&ut\t<leader>dO'  , 'lua require("dap").step_out()'  },
                { 'Step Back\t<leader>dh'  , 'lua require("dap").step_back()' },
                { '--' },
                { 'R&EPL\t<leader>dr' , 'lua require("dap").repl.toggle()' }
            }, '<auto>', 'c,cpp,go,python,rust,sh,dapui_watches,dapui_stacks,dapui_breakpoints,dapui_scopes,dapui_repl,dap-repl')

            vim.fn['quickui#menu#install']('H&elp', {
                { '&Cheatsheet' , 'help index' },
                { 'T&ips'       , 'help tips'  },
                { '--' },
                { '&Tutorial'        , 'help tutor'        },
                { '&Quick Reference' , 'help quickref'     },
                { '&Summary'         , 'help help-summary' },
                { '--' },
                { '&Zeal Lookup\t<leader>z'          , 'Zeavim'     },
                { 'Telesc&ope Cheatsheet\t<leader>?' , 'Cheatsheet' }
            }, 10000)

            vim.cmd [[
                nnoremap <silent> <leader>u :call quickui#menu#open()<cr>
                nnoremap <silent> <leader>U :call quickui#context#open(g:quickui_context_menu, { 'index': g:quickui#context#cursor })<cr>
                vnoremap <silent> <leader>U :<c-u>call quickui#context#open(g:quickui_selection_context_menu, { 'index': g:quickui#context#cursor })<cr>
            ]]
        end
    },
    -- ❵
    -- editing ❴
    'Raimondi/yaifa',
    'tpope/vim-ragtag',
    'tpope/vim-repeat',
    'tpope/vim-abolish',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    'farmergreg/vim-lastplace',
    { 'godlygeek/tabular', cmd = 'Tabularize' },
    {
        'karb94/neoscroll.nvim',
        config = [[require('neoscroll').setup{}]]
    },
    {
        'chaoren/vim-wordmotion',
        setup = [[vim.g.wordmotion_prefix = '<leader>']]
    },
    {
        'mattn/emmet-vim', keys = '<c-space>',
        setup = [[vim.g.user_emmet_leader_key = '<c-space>']]
    },
    {
        'phaazon/hop.nvim', keys = '<leader>H',
        config = function()
            vim.cmd [[
                nnoremap <silent> <leader>Hw :HopWord<cr>
                nnoremap <silent> <leader>Hl :HopLine<cr>
                nnoremap <silent> <leader>H1 :HopChar1<cr>
                nnoremap <silent> <leader>H2 :HopChar2<cr>
                nnoremap <silent> <leader>Hp :HopPattern<cr>
            ]]
        end
    },
    -- ❵
    -- navigation ❴
    'wincent/ferret',
    { 'tyru/open-browser.vim', opt = true },
    { 'simnalamburt/vim-mundo', opt = true },
    {
        't9md/vim-choosewin', keys = '-',
        config = function()
            vim.cmd [[nmap  -  <Plug>(choosewin)]]
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        keys = {
            { 'n', '<leader>O' },
            { 'n', '<leader>o' }
        },
        requires = { { 'nvim-lua/popup.nvim', opt = true } },
        wants = { 'popup.nvim', 'plenary.nvim' },
        config = function()
            vim.cmd [[
                nnoremap <silent>   <leader>O :Telescope<cr>

                nnoremap <silent>  <leader>om :Telescope marks<cr>
                nnoremap <silent>  <leader>oq :Telescope quickfix<cr>
                nnoremap <silent>  <leader>ol :Telescope loclist<cr>
                nnoremap <silent>  <leader>ot :Telescope current_buffer_tags<cr>
                nnoremap <silent>  <leader>oT :Telescope tags<cr>
                nnoremap <silent>  <leader>ob :Telescope buffers<cr>
                nnoremap <silent>  <leader>of :Telescope find_files<cr>
                nnoremap <silent>  <leader>oF :Telescope fd<cr>
                nnoremap <silent>  <leader>og :Telescope live_grep<cr>
                nnoremap <silent>  <leader>oo :Telescope treesitter<cr>

                nnoremap <silent> <leader>ogf :Telescope git_files<cr>
                nnoremap <silent> <leader>ogc :Telescope git_commits<cr>
            ]]
        end
    },
    {
        'fannheyward/telescope-coc.nvim',
        after = 'telescope.nvim',
        wants = 'coc.nvim',
        config = function()
            require('telescope').load_extension('coc')

            vim.cmd [[
                nnoremap <silent> <leader>oca :Telescope coc code_actions<cr>
                nnoremap <silent> <leader>ocA :Telescope coc file_code_actions<cr>
                nnoremap <silent> <leader>ocd :Telescope coc definitions<cr>
                nnoremap <silent> <leader>ocD :Telescope coc declarations<cr>
                nnoremap <silent> <leader>oci :Telescope coc implementations<cr>
                nnoremap <silent> <leader>oct :Telescope coc type_definitions<cr>
                nnoremap <silent> <leader>ocr :Telescope coc references<cr>
                nnoremap <silent> <leader>oco :Telescope coc links<cr>
                nnoremap <silent> <leader>oce :Telescope coc diagnostics<cr>
                nnoremap <silent> <leader>ocE :Telescope coc workspace_diagnostics<cr>
                nnoremap <silent> <leader>ocs :Telescope coc document_symbols<cr>
                nnoremap <silent> <leader>ocS :Telescope coc workspace_symbols<cr>
                nnoremap <silent> <leader>occ :Telescope coc commands<cr>
                nnoremap <silent> <leader>ocu :Telescope coc mru<cr>
            ]]
        end
    },
    {
        'nvim-telescope/telescope-dap.nvim',
        after = 'telescope.nvim',
        wants = 'nvim-dap',
        config = function()
            require('telescope').load_extension('dap')

            vim.cmd [[
                nnoremap <silent> <leader>odb :Telescope dap list_breakpoints<cr>
                nnoremap <silent> <leader>odv :Telescope dap variables<cr>
                nnoremap <silent> <leader>odf :Telescope dap frames<cr>
                nnoremap <silent> <leader>odc :Telescope dap commands<cr>
                nnoremap <silent> <leader>ods :Telescope dap configurations<cr>
            ]]
        end
    },
    {
        'aserowy/tmux.nvim',
        config = function()
            require('tmux').setup {
                navigation = {
                    persist_zoom = true
                }
            }

            vim.cmd [[
                nnoremap <silent> <c-h> :lua require('tmux').move_left()<cr>
                nnoremap <silent> <c-l> :lua require('tmux').move_right()<cr>

                tnoremap <silent> <c-h> <c-\><c-n>:lua require('tmux').move_left()<cr>
                tnoremap <silent> <c-j> <c-\><c-n>:lua require('tmux').move_bottom()<cr>
                tnoremap <silent> <c-k> <c-\><c-n>:lua require('tmux').move_top()<cr>
                tnoremap <silent> <c-l> <c-\><c-n>:lua require('tmux').move_right()<cr>

                nnoremap <silent> <m-h> :lua require('tmux').resize_left()<cr>
                nnoremap <silent> <m-j> :lua require('tmux').resize_bottom()<cr>
                nnoremap <silent> <m-k> :lua require('tmux').resize_top()<cr>
                nnoremap <silent> <m-l> :lua require('tmux').resize_right()<cr>

                tnoremap <silent> <m-h> <c-\><c-n>:lua require('tmux').resize_left()<cr>
                tnoremap <silent> <m-j> <c-\><c-n>:lua require('tmux').resize_bottom()<cr>
                tnoremap <silent> <m-k> <c-\><c-n>:lua require('tmux').resize_top()<cr>
                tnoremap <silent> <m-l> <c-\><c-n>:lua require('tmux').resize_right()<cr>
            ]]
        end
    },
    {
        'liuchengxu/vista.vim', keys = '<leader>t',
        setup = function()
            vim.g.vista_echo_cursor_strategy = 'floating_win'
            vim.g.vista_sidebar_width = math.modf(vim.o.columns / 4)
            vim.g.vista_executive_for = {
                c = 'coc', cpp = 'coc', go = 'coc', rust = 'coc', python = 'coc',
                html = 'coc', css = 'coc', javascript = 'coc', typescript = 'coc'
            }
        end,
        config = function()
            vim.g['vista#renderer#icons'] = vim.g.lsp_icons

            vim.cmd [[
                nnoremap <silent> <leader>t :Vista!!<cr>

                autocmd init BufEnter __vista__ set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline
                autocmd init BufLeave __vista__ set guicursor&
            ]]
        end
    },
    {
        'kyazdani42/nvim-tree.lua', keys = '<leader>k',
        wants = 'nvim-web-devicons',
        setup = function()
            vim.g.nvim_tree_add_trailing = 1
            vim.g.nvim_tree_indent_markers = 1
        end,
        config = function()
            require('nvim-tree').setup {
                view = {
                    width = math.modf(vim.o.columns / 4)
                }
            }
            vim.cmd [[
                nnoremap <silent> <leader>k :NvimTreeToggle<cr>

                autocmd init BufEnter NvimTree set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline
                autocmd init BufLeave NvimTree set guicursor&
            ]]
        end
    },
    -- ❵
    -- project ❴
    'jenterkin/vim-autosource',
    {
        'tpope/vim-obsession', cmd = 'Obsession',
        setup = [[vim.g.obsession_no_bufenter = 1]]
    },
    {
        'editorconfig/editorconfig-vim',
        setup = [[vim.g.EditorConfig_max_line_indicator = 'exceeding']]
    },
    -- ❵
    -- source control ❴
    'tpope/vim-fugitive',
    { 'samoshkin/vim-mergetool', opt = true },
    { 'chrisbra/vim-diff-enhanced', opt = true },
    -- ❵
    -- running ❴
    { 'kassio/neoterm', opt = true },
    { 'tpope/vim-dispatch', opt = true },
    {
        'NTBBloodbath/rest.nvim',
        keys = {
            '<Plug>RestNvim',
            '<Plug>RestNvimPreview'
        },
        wants = 'plenary.nvim',
        config = [[require('rest-nvim').setup{}]]
    },
    {
        'metakirby5/codi.vim', cmd = 'Codi',
        config = [[vim.g['codi#virtual_text_prefix'] = '■ ']]
    },
    {
        'thinca/vim-quickrun', keys = '<leader><cr>',
        setup = function()
            vim.g.quickrun_config = {
                _ = {
                    ['outputter/buffer/close_on_empty'] = 1
                },
                c = {
                    ['command'] = 'clang',
                    ['cmdopt'] = '-O0 -Wall -Wextra -lpthread'
                },
                cpp = {
                    ['command'] = 'clang++',
                    ['cmdopt'] = '-O0 -Wall -Wextra -pedantic -std=c++20 -lpthread'
                },
                swift = {
                    ['command'] = 'swiftc',
                    ['exec'] = { '%c %o %s -o %s:p:r', '%s:p:r %a' },
                    ['tempfile'] = '%{tempname()}.swift',
                    ['hook/sweep/files'] = { '%S:p:r' }
                },
                ocaml = {
                    ['command'] = 'corebuild',
                    ['cmdopt'] = '-quiet',
                    ['exec'] = { '%c %o %s:t:r.byte', './%s:t:r.byte %a' },
                    ['tempfile'] = '%{tempname()}.ml',
                    ['hook/cd/directory'] = '%S:p:h'
                },
                dats = {
                    ['command'] = 'patscc',
                    ['cmdopt'] = '-cleanaft',
                    ['exec'] = { '%c %o %s -o %s:p:r', '%s:p:r %a' },
                    ['tempfile'] = '%{tempname()}.dats',
                    ['hook/sweep/files'] = { '%S:p:r' }
                }
            }
        end,
        config = function()
            vim.cmd [[nmap <silent> <leader><cr> <Plug>(quickrun)]]
        end
    },
    {
        'oblitum/vim-slime', cmd = { 'SlimeRegionSend', 'SlimeParagraphSend' }, keys = '<c-c>',
        branch = 'tmux-bracketed-paste',
        setup = function()
            vim.g.slime_target = 'tmux'
            vim.g.slime_dont_ask_default = 1
            vim.g.slime_default_config = {
                socket_name = 'default',
                target_pane = '{right-of}'
            }
        end,
        config = function()
            vim.cmd [[
                xmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeRegionSend
                xmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeRegionSend
                xmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeRegionSend
                xmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeRegionSend
                nmap <silent> <c-c><c-h> :exec 'let g:slime_default_config.target_pane = "{left-of}"'<cr><Plug>SlimeParagraphSend
                nmap <silent> <c-c><c-j> :exec 'let g:slime_default_config.target_pane = "{down-of}"'<cr><Plug>SlimeParagraphSend
                nmap <silent> <c-c><c-k> :exec 'let g:slime_default_config.target_pane = "{up-of}"'<cr><Plug>SlimeParagraphSend
                nmap <silent> <c-c><c-l> :exec 'let g:slime_default_config.target_pane = "{right-of}"'<cr><Plug>SlimeParagraphSend
            ]]
        end
    },
    -- ❵
    -- debugging ❴
    { 'Termplexed/vfix', cmd = 'Vfix' },
    { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' },
    {
        'mfussenegger/nvim-dap', keys = '<leader>d',
        requires = {
            { 'rcarriga/nvim-dap-ui', module = 'dapui' },
            { 'mfussenegger/nvim-dap-python', module = 'dap-python' }
        },
        config = function()
            require('dapui').setup{}

            local dap = require('dap')

            dap.defaults.fallback.terminal_win_cmd = [[belowright new +let\ b:dap_terminal\ =\ 1]]
            vim.cmd (
                [[autocmd init TermClose * try                                    |]]..
                [[  call nvim_buf_get_var(eval(expand('<abuf>')), 'dap_terminal') |]]..
                [[  exec 'bd! ' . expand('<abuf>')                                |]]..
                [[catch | endtry                                                   ]]
            )

            require('dap-python').setup('/usr/bin/python')

            local extension_path = vim.fn.glob('~/Downloads/vscode-extensions/bash-debug/extension')

            dap.adapters.bashdb = {
                type = 'executable',
                command = 'node',
                args = { extension_path..'/out/bashDebug.js' }
            }

            dap.configurations.sh = {
                {
                    type = 'bashdb',
                    request = 'launch',
                    program = '${file}',
                    args = {},
                    env = {},
                    pathBash = 'bash',
                    pathBashdb = extension_path..'/bashdb_dir/bashdb',
                    pathBashdbLib = extension_path..'/bashdb_dir',
                    pathCat = 'cat',
                    pathMkfifo = 'mkfifo',
                    pathPkill = 'pkill',
                    cwd = '${workspaceFolder}',
                    terminalKind = 'integrated'
                }
            }

            -- INFO: execute ~/Downloads/vscode-extensions/codelldb/extension/adapter/codelldb --port 13000
            dap.adapters.codelldb = {
                type = 'server',
                host = '127.0.0.1',
                port = 13000
            }

            dap.configurations.c = {
                {
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    terminal = 'integrated'
                }
            }

            dap.configurations.cpp = dap.configurations.c

            dap.configurations.rust = {
                {
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    terminal = 'integrated',
                    sourceLanguages = { 'rust' }
                }
            }

            -- INFO: execute dlv dap -l 127.0.0.1:13001
            dap.adapters.go = {
                type = 'server',
                host = '127.0.0.1',
                port = 13001
            }

            dap.configurations.go = {
                {
                    type = 'go',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to module: ', vim.fn.getcwd(), 'dir')
                    end
                }
            }

            vim.cmd [[
                nnoremap <silent> <leader>dg :lua require('dap').continue()<cr>
                nnoremap <silent> <leader>dG :lua require('dap').run_to_cursor()<cr>
                nnoremap <silent> <leader>dp :lua require('dap').pause()<cr>
                nnoremap <silent> <leader>dd :lua require('dap').disconnect();require('dap').close();require('dapui').close()<cr>
                nnoremap <silent> <leader>db :lua require('dap').toggle_breakpoint()<cr>
                nnoremap <silent> <leader>dt :lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Tracepoint message: '))<cr>
                nnoremap <silent> <leader>dc :lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>
                nnoremap <silent> <leader>di :lua require('dap').step_into()<cr>
                nnoremap <silent> <leader>do :lua require('dap').step_over()<cr>
                nnoremap <silent> <leader>dO :lua require('dap').step_out()<cr>
                nnoremap <silent> <leader>dh :lua require('dap').step_back()<cr>
                nnoremap <silent> <leader>dr :lua require('dap').repl.toggle()<cr>

                nnoremap <silent> <leader>de :lua require('dapui').eval()<cr>
                vnoremap <silent> <leader>de <cmd>lua require('dapui').eval()<cr>

                vnoremap <silent> <leader>ds <cmd>lua require('dap-python').debug_selection()<cr>

                sign define DapStopped             text=️ texthl=CocHintSign linehl=CursorLine
                sign define DapLogPoint            text=️ texthl=CocWarningSign
                sign define DapBreakpoint          text=️ texthl=CocErrorSign
                sign define DapBreakpointRejected  text=️ texthl=CocInfoSign
                sign define DapBreakpointCondition text=️ texthl=CocErrorSign

                autocmd init BufEnter DAP\ Breakpoints,DAP\ Stacks,DAP\ Scopes set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline
                autocmd init BufLeave DAP\ Breakpoints,DAP\ Stacks,DAP\ Scopes set guicursor&
            ]]
        end
    },
    -- ❵
    -- documentation ❴
    { 'KabbAmine/zeavim.vim', cmd = { 'Zeavim', 'ZeavimV' }, keys = '<leader>z' },
    {
        'sudormrfbin/cheatsheet.nvim', cmd = 'Cheatsheet', keys = '<leader>?',
        after = 'telescope.nvim',
        wants = 'telescope.nvim',
        config = function()
            require('telescope').load_extension('cheatsheet')
        end
    },
    -- ❵
    -- snippets ❴
    'honza/vim-snippets',
    -- ❵
    -- ide ❴
    'wellle/tmux-complete.vim',
    {
        'neoclide/coc.nvim',
        branch = 'feat/use-ts-hi-group', run = 'yarn install --frozen-lockfile',
        setup = function()
            vim.g.coc_global_extensions = {
                'coc-db',
                'coc-go',
                'coc-sh',
                'coc-css',
                'coc-git',
                'coc-svg',
                'coc-xml',
                'coc-html',
                'coc-json',
                'coc-ltex',
                'coc-yaml',
                'coc-cmake',
                'coc-emmet',
                'coc-emoji',
                'coc-julia',
                'coc-lists',
                'coc-r-lsp',
                'coc-vetur',
                'coc-clangd',
                'coc-docker',
                'coc-eslint',
                'coc-kotlin',
                'coc-syntax',
                'coc-texlab',
                'coc-vimlsp',
                'coc-clojure',
                'coc-flutter',
                'coc-pyright',
                'coc-webview',
                'coc-prettier',
                'coc-snippets',
                'coc-sqlfluff',
                'coc-tsserver',
                'coc-lightbulb',
                'coc-diagnostic',
                'coc-translator',
                'coc-marketplace',
                'coc-sumneko-lua',
                'coc-markdownlint',
                'coc-rust-analyzer',
                'coc-styled-components',
                'coc-markdown-preview-enhanced'
            }

            vim.g.coc_status_error_sign   = '️'
            vim.g.coc_status_warning_sign = '️'

            vim.g.coc_filetype_map = { pandoc = 'markdown' }

            vim.g.coc_snippet_next = '<c-l>'
            vim.g.coc_snippet_prev = '<c-h>'

            vim.g.coc_user_config = {
                coc = {
                    preferences = {
                        snippetStatusText       = '️ ',
                        semanticTokensFiletypes = {'*'}
                    },
                    source = {
                        tmuxcomplete = {
                            enable = false
                        }
                    }
                },
                suggest = {
                    enablePreselect          = true,
                    noselect                 = false,
                    snippetIndicator         = ' ️ ',
                    defaultSortMethod        = 'none',
                    messageLevel             = 'warning',
                    completionItemKindLabels = vim.g.lsp_icons
                },
                signature = {
                    preferShownAbove = false
                },
                diagnostic = {
                    autoRefresh = false,
                    errorSign   = '️',
                    warningSign = '️',
                    infoSign    = '️',
                    hintSign    = 'ﯦ️'
                },
                lightbulb = {
                    statusText  = '️',
                    virtualText = '️',
                    only        = {
                        'quickfix',
                        'quickfix.ltex.acceptSuggestions'
                    }
                },
                snippets = {
                    extends = {
                        cpp             = { 'c' },
                        javascriptreact = { 'javascript' },
                        typescript      = { 'javascript' }
                    },
                    ultisnips = {
                        directories = { 'UltiSnips', 'gosnippets/UltiSnips' }
                    }
                },
                prettier = {
                    statusItemText = '️ '
                },
                git = {
                    enableGlobalStatus = false,
                    addedSign          = { text = '️', hlGroup = 'GitSignsAdd'    },
                    removedSign        = { text = '▁️', hlGroup = 'GitSignsDelete' },
                    changedSign        = { text = '️', hlGroup = 'GitSignsChange' },
                    topRemovedSign     = { text = '▔️', hlGroup = 'GitSignsDelete' },
                    changeRemovedSign  = { text = '️', hlGroup = 'GitSignsDelete' }
                },
                translator = {
                    toLang  = 'pt',
                    engines = { 'google' }
                },
                vimlsp = {
                    diagnostic = {
                        enable = false
                    }
                },
                ['sumneko-lua'] = {
                    enableNvimLuaDev = true
                },
                Lua = {
                    telemetry = {
                        enable = false
                    },
                    completion = {
                        callSnippet = 'Replace'
                    },
                    hint = {
                        enable = false
                    }
                },
                clangd = {
                    arguments = { '--cross-file-rename', '--completion-style=detailed' }
                },
                ['rust-analyzer'] = {
                    notifications = {
                        workspaceLoaded = false
                    },
                    checkOnSave = {
                        command = 'clippy'
                    },
                    inlayHints = {
                        typeHintsSeparator     = '■ ',
                        chainingHintsSeparator = '■ '
                    }
                },
                go = {
                    goplsOptions = {
                        usePlaceholders = true
                    }
                },
                tsserver = {
                    implicitProjectConfig = {
                        checkJs = true
                    }
                },
                eslint = {
                    quiet          = true,
                    packageManager = 'yarn'
                },
                texlab = {
                    chktex = { onOpenAndSave = true },
                    forwardSearch = {
                        executable = 'zathura',
                        args       = { '--synctex-forward', '%l:1:%f', '%p' }
                    },
                    build = {
                        executable = 'tectonic',
                        args       = { '%f', '--synctex', '--keep-logs', '--keep-intermediates' }
                    }
                },
                ltex = {
                    enabled = {
                        'bibtex',
                        'html',
                        'latex',
                        'markdown',
                        'org',
                        'restructuredtext',
                        'rsweave'
                    },
                    completionEnabled = true,
                    additionalRules = {
                        languageModel = '~/Downloads/ngrams'
                    }
                },
                xml = {
                    java = {
                        home = '/usr/lib/jvm/default'
                    }
                },
                markdownlint = {
                    config = {
                        ['line-length'] = {
                            code_block_line_length = 240
                        }
                    }
                },
                webview = {
                    openCommand = 'firefox -new-window "%u"'
                },
                sqlfluff = {
                    formatEnable = false
                },
                ['diagnostic-languageserver'] = {
                    filetypes = {
                        vim = 'vint'
                    }
                },
                languageserver = {
                    graphql = {
                        command      = 'graphql-lsp',
                        args         = { 'server', '-m', 'stream' },
                        filetypes    = { 'typescript', 'typescriptreact', 'graphql' }
                    },
                    haskell = {
                        command      = 'haskell-language-server-wrapper',
                        args         = { '--lsp' },
                        filetypes    = { 'haskell', 'lhaskell' },
                        rootPatterns = { '*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml' }
                    },
                    purescript = {
                        command      = 'purescript-language-server',
                        trace        = { server = 'off' },
                        args         = { '--stdio' },
                        filetypes    = { 'purescript' },
                        rootPatterns = { 'bower.json', 'psc-package.json', 'spago.dhall' },
                        settings     = { purescript = { addSpagoSources = true } }
                    },
                    rescript = {
                        enable       = true,
                        module       = '~/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js',
                        args         = { '--node-ipc' },
                        filetypes    = { 'rescript' },
                        rootPatterns = { 'bsconfig.json' }
                    },
                    zig = {
                        command      = 'zls',
                        filetypes    = { 'zig' }
                    }
                }
            }
        end,
        config = function()
            vim.cmd [[
                nmap     <silent>       <leader>cf <Plug>(coc-format)
                vmap     <silent>       <leader>cf <Plug>(coc-format-selected)
                nmap     <silent>       <leader>cA <Plug>(coc-codeaction)
                nmap     <silent>       <leader>ca <Plug>(coc-codeaction-cursor)
                vmap     <silent>       <leader>ca <Plug>(coc-codeaction-selected)
                nmap     <silent>       <leader>cl <Plug>(coc-codelens-action)
                nmap     <silent>       <leader>cI <Plug>(coc-diagnostic-info)
                nmap     <silent>       <leader>c[ <Plug>(coc-diagnostic-prev)
                nmap     <silent>       <leader>c] <Plug>(coc-diagnostic-next)
                nmap     <silent>       <leader>cg :call CocAction('diagnosticToggle')<cr>
                nmap     <silent>       <leader>cd <Plug>(coc-definition)
                nmap     <silent>       <leader>cD <Plug>(coc-declaration)
                nmap     <silent>       <leader>ci <Plug>(coc-implementation)
                nmap     <silent>       <leader>ct <Plug>(coc-type-definition)
                nmap     <silent>       <leader>cn <Plug>(coc-rename)
                nmap     <silent>       <leader>cr <Plug>(coc-references)
                nmap     <silent>       <leader>cu <Plug>(coc-references-used)
                nmap     <silent>       <leader>cR <Plug>(coc-refactor)
                nmap     <silent>       <leader>co <Plug>(coc-openlink)
                nmap     <silent>       <leader>cq <Plug>(coc-fix-current)
                nmap     <silent>       <leader>cC <Plug>(coc-git-commit)
                nmap     <silent>               [h <Plug>(coc-git-prevchunk)
                nmap     <silent>               ]h <Plug>(coc-git-nextchunk)
                nmap     <silent>       <leader>hp <Plug>(coc-git-chunkinfo)
                nnoremap <silent>       <leader>hu :CocCommand git.chunkUndo<cr>
                nnoremap <silent>       <leader>hs :CocCommand git.chunkStage<cr>
                nmap                    <leader>cT <Plug>(coc-translator-p)
                nnoremap <silent>       <leader>ch :call CocActionAsync('doHover')<cr>
                vnoremap <silent>       <leader>ch <cmd>call CocActionAsync('doHover')<cr>
                nnoremap <silent>       <leader>cH :call CocActionAsync('highlight')<cr>
                nnoremap <silent>      <leader>cci :call CocAction('incomingCalls')<cr>
                nnoremap <silent>      <leader>cco :call CocAction('outgoingCalls')<cr>
                inoremap <silent>       <c-space>s <cmd>call CocActionAsync('showSignatureHelp')<cr>
                nnoremap <silent><expr>      <c-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : ":lua require('tmux').move_bottom()<cr>"
                nnoremap <silent><expr>      <c-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : ":lua require('tmux').move_top()<cr>"
                inoremap <silent><expr>      <c-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<c-j>"
                inoremap <silent><expr>      <c-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<c-k>"
                vnoremap <silent><expr>      <c-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<c-j>"
                vnoremap <silent><expr>      <c-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<c-k>"
                inoremap <silent><expr>      <c-y> pumvisible() ? coc#_select_confirm() : "\<c-y>"
                inoremap <silent><expr> <c-space>r coc#refresh()
                nnoremap <silent>       <leader>cF :call CocActionAsync('fold')<cr>

                function! s:check_back_space() abort
                  let col = col('.') - 1
                  return !col || getline('.')[col - 1]  =~# '\s'
                endfunction

                inoremap <silent><expr> <TAB>
                      \ pumvisible() ? "\<C-n>" :
                      \ <SID>check_back_space() ? "\<TAB>" :
                      \ coc#refresh()
                inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

                " Make <CR> auto-select the first completion item and notify coc.nvim to
                " format on enter, <cr> could be remapped by other vim plugin
                inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

                "inoremap <silent><expr>       <cr> pumvisible() ? "\<c-e>\<cr>" : "\<cr>"

                autocmd init CursorHold * call CocActionAsync('diagnosticRefresh')
                autocmd init CompleteChanged * call coc#float#close_all()
                autocmd init User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
                autocmd init VimEnter,ColorScheme * hi! link CocFloating Pmenu
            ]]

            vim.cmd (
                [[autocmd init VimEnter,ColorScheme *                                                                                          ]]..
                [[  exec printf('hi CocErrorHighlight   gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocErrorSign'  , v:true).foreground) |]]..
                [[  exec printf('hi CocWarningHighlight gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocWarningSign', v:true).foreground) |]]..
                [[  exec printf('hi CocInfoHighlight    gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocInfoSign'   , v:true).foreground) |]]..
                [[  exec printf('hi CocHintHighlight    gui=undercurl guisp=#%06x', nvim_get_hl_by_name('CocHintSign'   , v:true).foreground)  ]]
            )

            vim.cmd (
                [[autocmd init FileType tex                                                   ]]..
                [[  nnoremap <buffer><silent> <leader>cb :CocCommand latex.Build<cr>         |]]..
                [[  nnoremap <buffer><silent> <leader>cB :CocCommand latex.BuildCancel<cr>   |]]..
                [[  nnoremap <buffer><silent> <leader>cz :CocCommand latex.ForwardSearch<cr>  ]]
            )
        end
    },
    -- ❵
    -- speech ❴
    { 'rhysd/vim-grammarous', opt = true },
    { 'phongvcao/vim-stardict', opt =  true },
    {
        'echuraev/translate-shell.vim', opt = true,
        setup = [[vim.g.trans_default_direction = ':pt']]
    },
    -- ❵
    -- writing ❴
    { 'reedes/vim-pencil', opt = true },
    -- ❵
    -- filetype ❴
    -- QMake ❴
    'suy/vim-qmake',
    -- ❵
    -- Binary ❴
    'fidian/hexmode',
    -- ❵
    -- Swift ❴
    'keith/swift.vim',
    -- ❵
    -- VimL ❴
    'Shougo/neco-vim',
    -- ❵
    -- Zig ❴
    'ziglang/zig.vim',
    -- ❵
    -- TOML ❴
    'cespare/vim-toml',
    -- ❵
    -- ATS ❴
    'bakpakin/ats2.vim',
    -- ❵
    -- Dhall ❴
    'vmchale/dhall-vim',
    -- ❵
    -- Kotlin ❴
    'udalov/kotlin-vim',
    -- ❵
    -- QML ❴
    'peterhoeg/vim-qml',
    -- ❵
    -- PGP ❴
    'jamessan/vim-gnupg',
    -- ❵
    -- cJSON ❴
    'neoclide/jsonc.vim',
    -- ❵
    -- Cypher ❴
    'memgraph/cypher.vim',
    -- ❵
    -- GLSL ❴
    'tikhomirov/vim-glsl',
    -- ❵
    -- GraphQL ❴
    'jparise/vim-graphql',
    -- ❵
    -- LESS ❴
    'groenewege/vim-less',
    -- ❵
    -- Spacebars ❴
    'Slava/vim-spacebars',
    -- ❵
    -- AppleScript ❴
    'mityu/vim-applescript',
    -- ❵
    -- i3 ❴
    'mboughaba/i3config.vim',
    -- ❵
    -- Idris ❴
    'idris-hackers/idris-vim',
    -- ❵
    -- JavaScript ❴
    'chemzqm/vim-jsx-improve',
    -- ❵
    -- Dart ❴
    'dart-lang/dart-vim-plugin',
    -- ❵
    -- ReScript ❴
    'rescript-lang/vim-rescript',
    -- ❵
    -- Haskell ❴
    'neovimhaskell/haskell-vim',
    'Twinside/vim-haskellConceal',
    -- ❵
    -- Pandoc ❴
    'vim-pandoc/vim-pandoc-syntax',
    -- ❵
    -- UML ❴
    'aklt/plantuml-syntax',
    'weirongxu/plantuml-previewer.vim',
    -- ❵
    -- PureScript ❴
    'purescript-contrib/purescript-vim',
    -- ❵
    -- Mathematica ❴
    {
        'voldikss/vim-mma',
        setup = [[vim.g.mma_candy = 1]]
    },
    -- ❵
    -- LaTeX ❴
    {
        'lervag/vimtex',
        setup = function()
            vim.g.vimtex_complete_enabled = 0
            vim.g.vimtex_matchparen_enabled = 0
        end
    },
    -- ❵
    -- Julia ❴
    {
        'JuliaEditorSupport/julia-vim',
        setup = [[vim.g.latex_to_unicode_tab = 'off']]
    },
    -- ❵
    -- SQL ❴
    'tpope/vim-dadbod',
    {
        'lifepillar/pgsql.vim',
        setup = [[vim.g.sql_type_default = 'pgsql']]
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        setup = [[vim.g.db_ui_use_nerd_fonts = 1]],
        config = function()
            vim.cmd [[
                autocmd init FileType dbout DisableWhitespace
                autocmd init BufEnter,WinEnter dbui set guicursor+=n:ver1-Transparent/lCursor | setlocal cursorline
                autocmd init WinLeave dbui set guicursor&
            ]]
        end
    }
    -- ❵
    -- ❵
}, config = {
    display = { open_fn = require('packer.util').float }
}}
pcall(require, 'impatient')
-- ❵
-- settings ❴
--vim.opt.colorscheme   = "fahrenheit"
vim.opt.encoding      = "utf-8"
vim.opt.number        = true
vim.opt.scrolloff     = 8
vim.opt.sidescrolloff = 16
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.smarttab      = true
vim.opt.ff            = "unix"
vim.opt.autoread      = true
vim.opt.signcolumn    = "yes"
vim.opt.colorcolumn   = "81"
vim.opt.exrc          = true
vim.opt.secure        = true
vim.opt.shell         = "/bin/bash"
vim.opt.list          = true
vim.opt.listchars     = "tab:>-,trail:."
-- niks infereior options above

vim.opt.conceallevel  = 2
vim.opt.expandtab     = true
vim.opt.hidden        = true
vim.opt.inccommand    = 'nosplit'
vim.opt.mouse         = 'a'
vim.opt.pumheight     = 30
vim.opt.shiftwidth    = 4
vim.opt.showmode      = false
vim.opt.softtabstop   = 4
vim.opt.spelllang     = { 'en', 'sr' }
vim.opt.swapfile      = false
vim.opt.synmaxcol     = 250
vim.opt.termguicolors = true
vim.opt.updatetime    = 300
--vim.opt.virtualedit   = 'all'          -- enables visual editing for every mode
vim.opt.visualbell    = true
vim.opt.wrap          = false
vim.opt.cpoptions:append('$')
vim.opt.shortmess:append('c')
vim.opt.completeopt    = "menu,menuone,noselect"

vim.g.mapleader = ' '
vim.g.lsp_icons = {
    ['operator']       = '∑',
    ['value']          = '',
    ['keyword']        = '𝒌',
    ['const']          = '𝒄',
    ['constant']       = '𝒄',
    ['var']            = '𝒗',
    ['variable']       = '𝒗',
    ['variables']      = '𝒗',
    ['reference']      = '𝒓',
    ['typeParameter']  = '𝒕',
    ['func']           = '𝒇',
    ['function']       = '𝒇',
    ['functions']      = '𝒇',
    ['method']         = '𝒎',
    ['subroutine']     = '𝒔',
    ['implementation'] = '𝒊',
    ['object']         = '𝒐',
    ['field']          = 'ⓕ',
    ['fields']         = 'ⓕ',
    ['property']       = 'ⓟ',
    ['member']         = 'ⓜ',
    ['constructor']    = 'ⓒ',
    ['enummember']     = 'ⓔ',
    ['enumMember']     = 'ⓔ',
    ['namespace']      = '🄽',
    ['macro']          = '🄼',
    ['macros']         = '🄼',
    ['type']           = '🅃',
    ['types']          = '🅃',
    ['typedef']        = '🄳',
    ['struct']         = '🅂',
    ['interface']      = '🄸',
    ['class']          = '🄲',
    ['union']          = '🅄',
    ['enum']           = '🄴',
    ['enumerator']     = '🄴',
    ['module']         = '️',
    ['modules']        = '️',
    ['package']        = '️',
    ['packages']       = '️',
    ['unit']           = '️',
    ['event']          = 'ε',
    ['file']           = '️',
    ['folder']         = '️',
    ['snippet']        = '️',
    ['map']            = '️',
    ['text']           = '️',
    ['color']          = '🎨️',
    ['target']         = '什️',
    ['augroup']        = '️'
}

vim.cmd [[
    augroup init | autocmd! | augroup end
    autocmd init VimEnter,ColorScheme * hi Transparent gui=strikethrough blend=100
    autocmd init VimLeave * set guicursor&
]]
-- ❵
-- filetype ❴
-- QuickFix ❴
-- Open QuickFix horizontally with line wrap
vim.cmd [[autocmd init FileType qf wincmd J | set wrap]]
-- ❵
-- Preview Window ❴
-- Preview window with line wrap
vim.cmd [[autocmd init WinEnter * if &previewwindow && &ft != 'dbout'| setlocal wrap | endif]]
-- ❵
-- VimL ❴
vim.cmd [[autocmd init FileType vim setlocal foldmethod=marker]]
-- ❵
-- Make ❴
vim.cmd [[autocmd init FileType make setlocal noexpandtab]]
-- ❵
-- C++ ❴
-- disable automatic label dedent
vim.cmd [[autocmd init FileType cpp setlocal cinoptions+=L0]]
-- ❵
-- Go ❴
vim.cmd [[autocmd init FileType go setlocal noexpandtab]]
-- ❵
-- CSS ❴
vim.cmd [[autocmd init FileType css set iskeyword+=-]]
-- ❵
-- Markdown ❴
vim.cmd [[autocmd init FileType markdown setlocal spell]]
-- ❵
-- Mmark ❴
vim.cmd [[autocmd init BufNewFile,BufRead *.mmark set ft=pandoc]]
-- ❵
-- Pandoc ❴
vim.cmd [[autocmd init FileType pandoc setlocal spell]]
-- ❵
-- Git ❴
vim.cmd [[autocmd init FileType gitcommit setlocal spell]]
-- ❵
-- i3 ❴
vim.cmd [[autocmd init BufNewFile,BufRead ~/.config/i3/config set ft=i3config]]
-- ❵
-- ❵
-- mappings ❴
vim.cmd [[
    " Toggle shell pasting
    set pastetoggle=<leader>P

    " Tabs
    nnoremap <silent> <leader>+ :tabnew<cr>
    nnoremap <silent> <leader>_ :tabclose<cr>
    nnoremap <silent> <leader>= :tabnext<cr>
    nnoremap <silent> <leader>- :tabprevious<cr>
    nnoremap <silent> <leader><bs> :exec 'set showtabline='.string(!&showtabline)<cr>
]]
-- ❵
-- vim:fdm=marker:fmr=❴,❵
