return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c", "cpp", "python", "lua", "vim", "vimdoc", "query",
			"markdown", "gitignore", "disassembly", "nasm",
			"glsl", "gitcommit", "cmake", "doxygen", "hlsl", "json",
			--"latex", "gnuplot",
			"make", "norg", "rust"
		},
		highlight = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
