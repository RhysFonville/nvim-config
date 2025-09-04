return {
	"nvim-lualine/lualine.nvim",
	dependencies = {"nvim-tree/nvim-web-devicons"},
	opts = {
		options = {
			component_separators = { left = " | ", right = " | " },
			section_separators = { left = "  ", right = "  " },
			icons_enabled = true,
			theme = "auto",
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
				refresh_time = 16, -- ~60fps
				events = {
					"WinEnter",
					"BufEnter",
					"BufWritePost",
					"SessionLoadPost",
					"FileChangedShellPost",
					"VimResized",
					"Filetype",
					"CursorMoved",
					"CursorMovedI",
					"ModeChanged",
				},
			},
		},
		sections = {
			lualine_a = {"mode"},
			lualine_b = {"branch", "diff", "diagnostics"},
			lualine_c = {"filename", "filetype", "filesize"},
			lualine_x = {"selectioncount", "searchcount"},
			lualine_y = {"lsp_status", "progress"},
			lualine_z = {"location"}
	 	},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {"filename"},
			lualine_x = {"location"},
			lualine_y = {},
			lualine_z = {}
		},
		--extensions = {"fzf", "lazy", "oil"}
	}
}
