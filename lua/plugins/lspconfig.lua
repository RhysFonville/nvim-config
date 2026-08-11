return {
	"https://github.com/neovim/nvim-lspconfig",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local keymap = vim.keymap
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "Show LSP references"
				keymap.set("n", "<leader>gR", vim.lsp.buf.references, opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- C/C++
		vim.lsp.config("clangd", {
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--completion-style=bundled",
				"--query-driver=/usr/bin/g++",
				"--log=verbose",
				"--header-insertion=never",
			},
			filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
			root_markers = {
				".clangd",
				".clang-tidy",
				".clang-format",
				"compile_commands.json",
				"compile_flags.txt",
				"configure.ac", -- AutoTools
				".git",
			},
			capabilities = {
				textDocument = {
					completion = {
						editsNearCursor = true,
					},
				},
				offsetEncoding = { "utf-8", "utf-16" },
			},
			on_init = function(client, init_result)
				if init_result.offsetEncoding then
					client.offset_encoding = init_result.offsetEncoding
				end
			end,
		})
		vim.lsp.enable("clangd")

		-- Bash
		vim.lsp.config("bashls", {capabilities = capabilities});
		vim.lsp.enable("bashls")

		-- Python
		vim.lsp.config("pyright", {capabilities = capabilities});
		vim.lsp.enable("pyright")

		-- Lua
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					-- diagnostics >= {
					--		 globals = { "vim" },
					--	 },
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

		-- CMake
		vim.lsp.config("cmake", {
			cmd = { "cmake-language-server" },
			filetypes = {"cmake"},
			init_options = {
				buildDirectory = "build"
			},
			root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" }
		})
		vim.lsp.enable("cmake")

		-- LaTeX, Markdown
		vim.lsp.config("ltex_plus", {
			capabilities = capabilities,
			filetypes = { "tex", "typst" }
		});
		vim.lsp.enable("ltex_plus")

		local x = vim.diagnostic.severity
		local icons = require("config.icons")
		local config = {
			update_in_insert = true,
			signs = {
				text = {
					[x.ERROR] = icons.diagnostics.Error,
					[x.WARN] = icons.diagnostics.Warn,
					[x.HINT] = icons.diagnostics.Hint,
					[x.INFO] = icons.diagnostics.Info,
				},
				numhl = {
					[x.ERROR] = "WarningMsg",
					[x.WARN] = "ErrorMsg",
					[x.HINT] = "DiagnosticHint",
					[x.INFO] = "DiagnosticInfo",
				},
			},
			underline = true,
			severity_sort = true,
			float = {
				focusable = false,
				--style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(config)

		-- add borders to lsp info window
		require("lspconfig.ui.windows").default_options.border = "single"

		vim.api.nvim_create_autocmd("CursorHold", {
            pattern = { "*" }, -- Apply to all file types
            callback = function()
            vim.diagnostic.open_float()
            end,
        })
	end,
}

