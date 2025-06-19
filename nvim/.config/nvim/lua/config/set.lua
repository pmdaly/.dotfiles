vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
-- column for debugging
--vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

-- Cross-platform Python path detection
local function get_python_path()
    local python_paths = {
        vim.fn.exepath("python3"),
        vim.fn.exepath("python"),
        "/usr/bin/python3",
        "/usr/local/bin/python3",
        "/opt/homebrew/bin/python3"
    }
    
    for _, path in ipairs(python_paths) do
        if path and path ~= "" then
            return path
        end
    end
    
    return "python3" -- fallback
end

vim.g.python3_host_prog = get_python_path()

-- .j2 is a jenkinsfile
vim.filetype.add({ extension = {j2 = 'groovy'}})

vim.o.splitright = true

-- Additional settings for better experience
vim.opt.mouse = 'a'  -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard
vim.opt.ignorecase = true  -- Case insensitive search
vim.opt.smartcase = true   -- Case sensitive when uppercase
vim.opt.showmatch = true   -- Show matching brackets
vim.opt.cursorline = true  -- Highlight current line
vim.opt.cursorcolumn = false  -- Don't highlight current column
vim.opt.completeopt = 'menuone,noselect'  -- Better completion
vim.opt.wildmenu = true    -- Better command completion
vim.opt.wildmode = 'list:longest'  -- Command completion mode
vim.opt.list = false       -- Don't show whitespace by default
vim.opt.listchars = 'tab:> ,trail:·'  -- Whitespace characters
vim.opt.foldmethod = 'indent'  -- Fold by indent
vim.opt.foldlevel = 99     -- Don't fold by default
vim.opt.foldenable = false -- Don't fold by default
