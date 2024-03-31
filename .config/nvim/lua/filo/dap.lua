-- DAP setup
local dap = require('dap')

-- Python debugging setup
dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch Python File",
    program = "${file}",
    pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python3'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python3'
        else
            return '/usr/bin/python3'
        end
    end,
  },
}

-- C/C++ debugging setup (using lldb-vscode)
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- Adjust this path to your lldb-vscode executable
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch C++ File",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  }
}

dap.configurations.c = dap.configurations.cpp

-- Node.js debugging setup
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.vscode-node-debug2/out/src/nodeDebug.js'}, -- Adjust the path to your nodeDebug.js which is part of vscode-node-debug2
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    name = 'Launch Node.js Program',
    program = '${file}',
    cwd = vim.fn.getcwd(),
  }
}

-- Optional: Automatically open dap-ui when debugging starts
local dapui = require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- dap-ui setup
dapui.setup({
  -- Customize dap-ui layout and elements as needed
})

-- Key mappings for dap (optional)
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require("dap").step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require("dap").step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require("dap").step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>B', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>lp', '<cmd>lua require("dap").run_last()<CR>', { noremap = true, silent = true })

