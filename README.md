# github-open.nvim

> Open the file or the line under the cursor in your browser

## Install

With `Plug`

```lua
Plug 'mrexox/github-open.nvim'
```

With `lazy.nvim`

```lua
{
  "mrexox/github-open.nvim",
  keys = {
    { "<leader>gh", function() require('github-open').open_file() end, },
    { "<leader>gl", function() require('github-open').open_line() end, },
  },
},
```

## Usage

Add keybindings to `~/.config/nvim/init.lua`

```lua
vim.keymap.set('n', '<Leader>gh', require('github-open').open_file, noremap = true, silent = true)
vim.keymap.set('n', '<Leader>gl', require('github-open').open_line, noremap = true, silent = true)
```

Or to `~/.config/nvim/init.vim`

```vim
silent! nnoremap <leader>gh :GithubOpenFile<cr>
silent! nnoremap <leader>gl :GithubOpenLine<cr>
```
