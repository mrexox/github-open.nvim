# github-open.nvim

> Open the file or the line under the cursor in your browser

## Install

With `Plug`

```lua
Plug 'mrexox/github-open.nvim'
```

## Usage

Add keybindings to `~/.config/nvim/init.lua`

```lua
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>gh', require('github-open').open_file, opts)
vim.keymap.set('n', '<Leader>gl', require('github-open').open_line, opts)
```

Or to `~/.config/nvim/init.vim`

```vim
silent! nnoremap <leader>gh :GithubOpenFile<cr>
silent! nnoremap <leader>gl :GithubOpenLine<cr>
```
