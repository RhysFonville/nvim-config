return {
	{
		"https://github.com/sainnhe/sonokai",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd.colorscheme("sonokai")
			vim.o.background = "dark"
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_style = "andromeda"
			vim.g.sonokai_better_performance = 1
		end,
	},
}
