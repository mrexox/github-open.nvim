local lib = require('github-open.lib')

local M = {}

M.open_file = lib.open_file
M.open_line = lib.open_line
M.open_commit = lib.open_commit
M.open_blame_line = lib.open_blame_line

return M
