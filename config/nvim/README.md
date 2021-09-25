# nvim-config

## Setup

```
git clone https://gitlab.com/livk/nvim-config
mv ~/.config/nvim ~/.config/nvim.old
ln -s $(pwd)/nvim-config $HOME/.config/nvim
```

## Useful keys / commands

`<leader>` is mapped to `<space>`

- `<space>s` - save
- `<space>ff` - find file
- `<space>q` - quit, closes all windows
- `alt+t` - toggle floating terminal
- `:LspInstall [language]` - press tab for list of installable languages, for
  completion, diagnostics, all that nice lsp stuff
- `:TSInstall [language]` - press tab for list of installable languages, for
  better syntax highlighting, all that nice tree sitter stuff

## Plugin management

The following are equivalent:

```
:PkgAdd user/repo
:PkgAdd https://github.com/user/repo
```

Update all packages with `:PkgUpdate`

If a package requires action after updating, add the following between
`pkg.init()` and `pkg.load()`:

```lua
pkg.hook("user/repo", {
   fetch = function()
      -- Do stuff here
   end
}
```

## Plugins

- [rktjmp/lush.nvim](https://github.com/rktjmp/lush.nvim)
- [npxbr/gruvbox.nvim](https://github.com/npxbr/gruvbox.nvim)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [kabouzeid/nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall)
- [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-lua/completion-nvim](https://github.com/nvim-lua/completion-nvim)
- [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
- [hrsh7th/vim-vsnip-integ](https://github.com/hrsh7th/vim-vsnip-integ)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [b3nj5m1n/kommentary](https://github.com/b3nj5m1n/kommentary)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [p00f/nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [numToStr/Navigator.nvim](https://github.com/numToStr/Navigator.nvim)
- [numtostr/FTerm.nvim](https://github.com/numtostr/FTerm.nvim)
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
- [folke/twilight.nvim](https://github.com/folke/twilight.nvim)
- [windwp/nvim-projectconfig](https://github.com/windwp/nvim-projectconfig)
