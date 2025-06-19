-- Performance optimizations (community standard)
vim.opt.hidden = true        -- Allow switching buffers without saving
vim.opt.backup = false       -- Disable backups (git handles version control)
-- vim.opt.writebackup = false   -- Keep for file save safety
-- vim.opt.swapfile = false      -- Keep for crash recovery
-- vim.opt.lazyredraw = true     -- Rarely used, minimal benefit

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('config.set')
require('config.remap')
require("lazy").setup("plugins")
require('lang.python')
require("luasnip.loaders.from_vscode").lazy_load()