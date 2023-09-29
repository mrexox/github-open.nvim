local M = {}

local function remote()
  local remotes = vim.fn.trim(vim.fn.system({'git', 'remote', '-v'}))
  local remote
  for r in remotes:gmatch("[^\r\n]+") do
    res = r:match('origin%s+.+%s.fetch.')
    if res then
      remote = res
      break
    end
  end

  remote = remote:gsub('origin%s+', ''):gsub('%s+.fetch.', '')
  if remote:match('^git@') then
    remote = "https://" .. remote:gsub('^git@', ''):gsub(':', '/')
  end
  remote = remote:gsub('.git$', '')

  return remote
end

local function meta()
  local full_path = vim.fn.expand('%:p')
  local git_root = vim.fn.trim(vim.fn.system({ 'git', 'rev-parse', '--show-toplevel' }))
  local branch = vim.fn.trim(vim.fn.system({ 'git', 'rev-parse', '--abbrev-ref', 'HEAD' }))
  local path = string.sub(full_path, git_root:len()+1)

  return {
    full_path = full_path,
    git_root = git_root,
    branch = branch,
    path = path:gsub('^/', ''),
    repo = remote(),
  }
end

local function opener()
  if vim.fn.has('macunix') then
    return 'open'
  elseif vim.fn.has('unix') then
    return 'xdg-open'
  else
    return 'start'
  end
end

function M.open_file()
  local meta = meta()
  local url = meta.repo .. '/blob/' .. meta.branch .. '/' .. meta.path

  vim.print("Opening " .. url)

  vim.fn.system({ opener() , url })
end

function M.open_line()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local meta = meta()
  local url = meta.repo .. '/blob/' .. meta.branch .. '/' .. meta.path .. '#L' .. line

  vim.print("Opening " .. url)

  vim.fn.system({ opener() , url })
end

return M
