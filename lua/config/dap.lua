local dap = require("dap")
local dapui = require("dapui")

local codelldb_path = vim.fn.expand("~/.local/share/nvim/codelldb/extension/adapter/codelldb")

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb_path,
    args = { "--port", "${port}" },
  },
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp

dapui.setup({})
require("nvim-dap-virtual-text").setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "CursorLine", numhl = "" })

local map = function(lhs, rhs, desc)
  vim.keymap.set("n", lhs, rhs, { desc = desc })
end

map("<leader>db", function() dap.toggle_breakpoint() end, "Debug: Toggle breakpoint")
map("<leader>dc", function() dap.continue() end, "Debug: Continue / start")
map("<leader>do", function() dap.step_over() end, "Debug: Step over")
map("<leader>di", function() dap.step_into() end, "Debug: Step into")
map("<leader>dO", function() dap.step_out() end, "Debug: Step out")
map("<leader>dr", function() dap.repl.open() end, "Debug: Open REPL")
map("<leader>du", function() dapui.toggle() end, "Debug: Toggle UI")
map("<leader>dt", function() dap.terminate() end, "Debug: Terminate session")
