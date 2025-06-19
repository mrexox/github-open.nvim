# github-open.nvim

> Open the file or the line under the cursor in your browser

## Install

For `lazy.nvim`

```lua
{
  "mrexox/github-open.nvim",
  keys = {
    { "<leader>gh", function() require('github-open').open_file() end, },
    { "<leader>gl", function() require('github-open').open_line() end, },
    { "<leader>gb", function() require("github-open").open_blame_line() end, },
    { "<leader>gc", function() require("github-open").open_commit() end, },
  },
},
```

For `Plug`

```lua
Plug 'mrexox/github-open.nvim'
```

## Configure

If you're not using lazy.nvim, you can configure the keymaps manually.

Add keybindings to `~/.config/nvim/init.lua`

```lua
vim.keymap.set('n', '<leader>gh', require('github-open').open_file, noremap = true, silent = true)
vim.keymap.set('n', '<leader>gl', require('github-open').open_line, noremap = true, silent = true)
vim.keymap.set('n', '<leader>gb', require('github-open').open_blame_line, noremap = true, silent = true)
vim.keymap.set('n', '<leader>gc', require('github-open').open_commit, noremap = true, silent = true)
```

Or to `~/.config/nvim/init.vim`

```vim
silent! nnoremap <leader>gh :GithubOpenFile<cr>
silent! nnoremap <leader>gl :GithubOpenLine<cr>
silent! nnoremap <leader>gb :GithubOpenBlameLine<cr>
silent! nnoremap <leader>gc :GithubOpenCommit<cr>
```

## Usage

Here's the description of functions provided by this plugin.

`open_file` – opens the file on Github
`open_line` – opens the file on Github, highlighting the line your cursor is on
`open_blame_line` – opens the file on the Github, in a blame mode
`open_commit` – opens the commit which was last to edit the line under your cursor
