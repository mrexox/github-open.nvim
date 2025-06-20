local helpers = require("github-open.helpers")
local M = {}

--- Opens the file of current buffer in Github, in the default browser.
M.open_file = function()
  local meta = helpers.project_info()
  local url = meta.repo .. '/blob/' .. meta.branch .. '/' .. meta.path

  vim.print("Opening " .. url)
  vim.fn.system({ helpers.opener , url })
end

--- Opens the file of current buffer in Github, highlights the line cursor is on.
M.open_line = function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local meta = helpers.project_info()
  local url = meta.repo .. '/blob/' .. meta.branch .. '/' .. meta.path .. '#L' .. line

  vim.print("Opening " .. url)
  vim.fn.system({ helpers.opener , url })
end

--- Opens the file of current buffer in Github in blame mode, highlights the line cursor is on.
M.open_blame_line = function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local meta = helpers.project_info()
  local url = meta.repo .. '/blame/' .. meta.branch .. '/' .. meta.path .. '#L' .. line

  vim.print("Opening " .. url)
  vim.fn.system({ helpers.opener , url })
end

--- Opens the commit which was the last edited the line under the cursor.
M.open_commit = function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local meta = helpers.project_info()
  local blame = vim.fn.trim(vim.fn.system({ 'git', 'blame', '-L', line .. ',' .. line, meta.full_path }))
  local commit = helpers.split_string(blame)[1]
  commit = commit:gsub("[^%w]+", "")
  local url = meta.repo .. '/commit/' .. commit

  if commit == "00000000" then
    vim.print("Line #" .. line .. " is not committed yet")
    return
  end

  vim.print("Opening " .. url)
  vim.fn.system({ helpers.opener , url })
end

return M
