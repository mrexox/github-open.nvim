# github-open.nvim

> Open the file or the line under your cursor in your browser

## Install

With `Plug`

```lua
Plug 'mrexox/github-open.nvim'
```

## Usage

```lua
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>gh', require('github-open').open_file, opts)
vim.keymap.set('n', '<Leader>gl', require('github-open').open_line, opts)
```
