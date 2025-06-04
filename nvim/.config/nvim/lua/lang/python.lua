--[[
local M = {}

local path = require('lspconfig.util').path

local function get_poetry_dir()
  return vim.fn.trim(vim.fn.system 'poetry env info -p')
end

local function get_python_dir(workspace)
  local poetry_match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if poetry_match ~= '' then
    return get_poetry_dir()
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs { '*', '.*' } do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.dirname(match)
    end
  end

  return ''
end

local _virtual_env = ''
local _package = ''

local function py_bin_dir()
  if is_windows then
    return path.join(_virtual_env, 'Scripts;')
  else
    return path.join(_virtual_env, 'bin:')
  end
end

M.env = function(root_dir)
  if not vim.env.VIRTUAL_ENV or vim.env.VIRTUAL_ENV == '' then
    _virtual_env = get_python_dir(root_dir)
  end

  if _virtual_env ~= '' then
    vim.env.VIRTUAL_ENV = _virtual_env
    vim.env.PATH = py_bin_dir() .. vim.env.PATH
  end

  if _virtual_env ~= '' and vim.env.PYTHONHOME then
    vim.env.old_PYTHONHOME = vim.env.PYTHONHOME
    vim.env.PYTHONHOME = ''
  end

  return _virtual_env ~= '' and py_bin_dir() or ''
end

return M
--]]
local util = require("lspconfig").util
local path = util.path

local function get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end

    -- Find and use virtualenv if it exists in current git project
    local git_root = vim.fn.trim(vim.fn.system("git -C " .. workspace .. " rev-parse --show-toplevel"))
    if git_root ~= "" then
        local venv_python = path.join(git_root, ".venv", "bin", "python")
        if vim.fn.executable(venv_python) == 1 then
            return venv_python
        end
    end

    -- Find and use virtualenv via poetry in workspace directory.
    local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
    if match ~= "" then
        local venv = vim.fn.trim(vim.fn.system "poetry env info -p")
        return path.join(venv, "bin", "python")
    end

    -- Fallback to system Python.
    return vim.fn.exepath "python3" or vim.fn.exepath "python" or "python"
end

require("lspconfig").pyright.setup {
    on_init = function(client)
        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
    end,
}
