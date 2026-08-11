return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			["clang-format"] = {
				args = {
					"--style=file:/home/rhys/.config/.clang-format",
					"--assume-filename=$FILENAME"
				},
				stdin = true
			},
		},
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			h = { "clang-format" },
			hpp = { "clang-format" },
		}
	},
}

