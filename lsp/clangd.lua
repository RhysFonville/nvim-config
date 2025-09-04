return {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=bundled",
		"--cross-file-rename",
		"--header-insertion=iwyu",
	},
	filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
	root_markers = {
		'.clangd',
		'.clang-tidy',
		'.clang-format',
		'compile_commands.json',
		'compile_flags.txt',
		'configure.ac', -- AutoTools
		'.git',
	},
	capabilities = {
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
		},
		offsetEncoding = { 'utf-8', 'utf-16' },
	},
	on_init = function(client, init_result)
		if init_result.offsetEncoding then
			client.offset_encoding = init_result.offsetEncoding
		end
	end,
}
