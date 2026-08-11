return {
	"https://github.com/Saghen/blink.cmp",
	enabled = true,
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		signature = { enabled = true },
		sources = {
			default = { "lsp", "path", "snippets" }, -- no "buffer"
		},
		completion = {
			accept = {
				auto_brackets = { enabled = false, }
			},
		},
		keymap = {
			preset = "none",
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
		},
		cmdline = {
			keymap = { preset = "enter" },
		},
	},
}
