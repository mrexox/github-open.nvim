" Title:        Github Open
" Description:  Simply open the file/line in Github
" Maintainer:   Valentin Kiselev (mrexox@yahoo.com)

" Prevents the plugin from being loaded multiple times.
if exists("g:github_open")
    finish
endif
let g:github_open = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/github-open/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

command! -nargs=0 GithubOpenFile lua require("github-open").open_file()
command! -nargs=0 GithubOpenLine lua require("github-open").open_line()
command! -nargs=0 GithubOpenBlameLine lua require("github-open").open_blame_line()
command! -nargs=0 GithubOpenCommit lua require("github-open").open_commit()
