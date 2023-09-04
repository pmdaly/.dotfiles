return {
	"nvim-telescope/telescope.nvim",
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
		'<leader>gg', 
		function() require('telescope.builtin').live_grep() end,
	},
	{
		'<leader>fs', 
		function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end,
	}
	}
}
