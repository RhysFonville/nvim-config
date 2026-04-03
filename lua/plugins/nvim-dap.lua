return {
	"mfussenegger/nvim-dap",
	lazy = true,
	config = function()
		local dap = require('dap')

		dap.adapters.lldb = {
			type = 'executable',
			command = '/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap',
			name = 'lldb'
		}
		dap.configurations.cpp = {
			{
				name = 'launch',
				type = 'lldb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				args = {},

				-- 💀
				-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
				--
				--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
				--
				-- Otherwise you might get the following error:
				--
				--    Error on launch: Failed to attach to the target process
				--
				-- But you should be aware of the implications:
				-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
				-- runInTerminal = false,
			},
		}
		dap.configurations.c = dap.configurations.cpp

		vim.keymap.set("n", "<leader>dn", ":DapNew<CR>", {});

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dl", dap.list_breakpoints, {})

		vim.keymap.set("n", "<Down>", dap.step_over, {})
		vim.keymap.set("n", "<Left>", dap.step_into, {})
		vim.keymap.set("n", "<Right>", dap.step_out, {})
		vim.keymap.set("n", "<Up>", dap.restart_frame, {})

		vim.keymap.set("n", "<leader>dc", dap.continue, {})
		vim.keymap.set("n", "<leader>dr", dap.restart, {})
		vim.keymap.set("n", "<leader>dg", dap.run_to_cursor, {})
		vim.keymap.set("n", "<leader>dq", dap.terminate, {})
	end
}

