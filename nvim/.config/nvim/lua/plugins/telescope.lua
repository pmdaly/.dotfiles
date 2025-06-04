return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = {'nvim-lua/plenary.nvim'},
        keys = {
        {
            '<leader>ff',
            function() require('telescope.builtin').find_files() end,
        },
        {
            '<leader>fp',
            function() require('telescope.builtin').git_files() end,
        },
        {
            '<leader>fg',
            function() require('telescope.builtin').live_grep() end,
        },
        {
            '<leader>fw',
            function() require('telescope.builtin').grep_string() end,
        },
        {
            '<leader>fs',
            function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end,
        }
        }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
    }
}
