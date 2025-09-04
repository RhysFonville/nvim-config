return {
	"https://github.com/stevearc/oil.nvim",
	opts = {
		view_options = {
			is_hidden_file = function(name, bufnr)
				return name == "."
			end,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function(_, opts) require("oil").setup(opts) end,
}
