local M = {}

local opener
if vim.fn.has('macunix') == 1 then
  opener = 'open'
elseif vim.fn.has('unix') == 1 then
  opener = 'xdg-open'
else
  opener = 'start'
end

M.opener = opener

-- Returns the URL of the (fetch) remote
local function repo_url()
  local remotes = vim.fn.trim(vim.fn.system({'git', 'remote', '-v'}))
  local remote
  for r in remotes:gmatch("[^\r\n]+") do
    res = r:match('origin%s+.+%s.fetch.')
    if res then
      remote = res
      break
    end
  end

  remote = remote:gsub('origin%s+', ''):gsub('%s+.fetch.', ''):gsub('.git$', '')
  if remote:match('^git@') then
    remote = "https://" .. remote:gsub('^git@', ''):gsub(':', '/')
  end

  return remote
end

-- Information about the project of the file.
-- Assumes that the PWD is in the git project.
M.project_info = function()
  local full_path = vim.fn.expand('%:p')
  local git_root = vim.fn.trim(vim.fn.system({ 'git', 'rev-parse', '--show-toplevel' }))
  local branch = vim.fn.trim(vim.fn.system({ 'git', 'rev-parse', '--abbrev-ref', 'HEAD' }))
  local path = string.sub(full_path, #git_root+1)

  return {
    full_path = full_path,
    git_root = git_root,
    branch = branch,
    path = path:gsub('^/', ''),
    repo = repo_url(),
  }
end

-- Splits the string and returns an array
M.split_string = function(input, delimiter)
  if delimiter == nil then
    delimiter = "%s"  -- Default to whitespace
  end
  local result = {}
  for match in (input .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

return M
