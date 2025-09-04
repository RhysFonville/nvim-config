return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional for icon support
	},
	config = function()
		require("fzf-lua").setup({
			"telescope",
			keymap = {
				-- fzf '--bind=' options
				fzf_binds = {
					["ctrl-j"]    = "down",
					["ctrl-k"]    = "up",
					["ctrl-n"]    = "next",
					["ctrl-p"]    = "previous",
				},
			},
		})
	end,
}
