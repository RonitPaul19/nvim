return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI panel: stacks, scopes, breakpoints, watches, console
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
			},
			-- Inline variable values next to code while debugging
			"thehamsta/nvim-dap-virtual-text",
			-- Auto-install and wire up debug adapters via Mason
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = { "williamboman/mason.nvim" },
			},
			-- Python-specific helper (finds venvs, sets up debugpy configs)
			"mfussenegger/nvim-dap-python",
		},

		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debug: Continue/Start",
			},
			{
				"<F17>",
				function()
					require("dap").terminate()
				end,
				desc = "Debug: Stop",
			}, -- Shift+F5
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: Step Over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: Step Into",
			},
			{
				"<F23>",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: Step Out",
			}, -- Shift+F11
			{
				"<F9>",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug: Toggle Breakpoint",
			},

			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Conditional Breakpoint",
			},
			{
				"<leader>dl",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Log Point",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
			{
				"<leader>dj",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run To Cursor",
			},
			{
				"<leader>dL",
				function()
					require("dap").run_last()
				end,
				desc = "Run Last",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle DAP UI",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval(nil, { enter = true })
				end,
				desc = "Eval Expression Under Cursor",
				mode = { "n", "v" },
			},
		},

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			------------------------------------------------------------------
			-- Mason: auto-install the three adapters we need
			------------------------------------------------------------------
			require("mason-nvim-dap").setup({
				ensure_installed = { "codelldb", "debugpy", "js-debug-adapter" },
				automatic_installation = true,
				-- we configure adapters ourselves below for full control
				handlers = {},
			})

			------------------------------------------------------------------
			-- Breakpoint signs (nicer than the default)
			------------------------------------------------------------------
			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "◆", texthl = "DiagnosticWarn", linehl = "", numhl = "" }
			)
			vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "▶", texthl = "DiagnosticOk", linehl = "CursorLine", numhl = "" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "✗", texthl = "DiagnosticError", linehl = "", numhl = "" }
			)

			------------------------------------------------------------------
			-- C / C++  ->  codelldb
			------------------------------------------------------------------
			local mason_registry = require("mason-registry")
			local codelldb_root = mason_registry.get_package("codelldb"):get_install_path()
			local codelldb_path = codelldb_root .. "/extension/adapter/codelldb"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--port", "${port}" },
				},
			}

			local cpp_config = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = function()
						local args_str = vim.fn.input("Program arguments: ")
						return vim.split(args_str, " ", { trimempty = true })
					end,
				},
				{
					name = "Attach to process",
					type = "codelldb",
					request = "attach",
					pid = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}

			dap.configurations.c = cpp_config
			dap.configurations.cpp = cpp_config

			------------------------------------------------------------------
			-- Python  ->  debugpy
			------------------------------------------------------------------
			-- Points at Mason's own debugpy install. nvim-dap-python builds the
			-- `python` adapter/config for us; it auto-detects an active venv too.
			local debugpy_python = mason_registry.get_package("debugpy"):get_install_path() .. "/venv/bin/python3"
			require("dap-python").setup(debugpy_python)

			-- Extra ready-made configs (test runners) on top of the defaults
			table.insert(dap.configurations.python, {
				type = "python",
				request = "launch",
				name = "Launch file with arguments",
				program = "${file}",
				args = function()
					local args_str = vim.fn.input("Script arguments: ")
					return vim.split(args_str, " ", { trimempty = true })
				end,
			})

			------------------------------------------------------------------
			-- TypeScript / JavaScript  ->  js-debug-adapter (vscode-js-debug)
			------------------------------------------------------------------
			local js_debug_path = mason_registry.get_package("js-debug-adapter"):get_install_path()

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = { js_debug_path .. "/js-debug/src/dapDebugServer.js", "${port}" },
				},
			}

			local js_ts_config = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file (node)",
					program = "${file}",
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					skipFiles = { "<node_internals>/**" },
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file (ts-node)",
					program = "${file}",
					cwd = "${workspaceFolder}",
					runtimeExecutable = "node",
					runtimeArgs = { "--loader", "ts-node/esm" },
					sourceMaps = true,
					protocol = "inspector",
					skipFiles = { "<node_internals>/**" },
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to process",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug npm script (npm run dev)",
					runtimeExecutable = "npm",
					runtimeArgs = { "run", "dev" },
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					sourceMaps = true,
				},
			}

			dap.configurations.typescript = js_ts_config
			dap.configurations.javascript = js_ts_config
			dap.configurations.typescriptreact = js_ts_config
			dap.configurations.javascriptreact = js_ts_config

			------------------------------------------------------------------
			-- UI: open/close automatically when a session starts/ends
			------------------------------------------------------------------
			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.35 },
							{ id = "breakpoints", size = 0.15 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						position = "left",
						size = 45,
					},
					{
						elements = {
							{ id = "repl", size = 0.6 },
							{ id = "console", size = 0.4 },
						},
						position = "bottom",
						size = 12,
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			------------------------------------------------------------------
			-- Inline virtual text (values shown next to variables while stopped)
			------------------------------------------------------------------
			require("nvim-dap-virtual-text").setup({
				commented = true, -- show as a comment at end of line
			})
		end,
	},
}
