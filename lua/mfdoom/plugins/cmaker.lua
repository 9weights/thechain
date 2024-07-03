return {
    {'Civitasv/cmake-tools.nvim',
        config = function()
            require("cmake-tools").setup {
                cmake_dap_configuration = { -- debug settings for cmake
                    name = "cpp",
                    type = "codelldb",
                    request = "launch",
                    stopOnEntry = false,
                    runInTerminal = false,
                    --console = "integratedTerminal",
                },
            }
        vim.g.isDebugging = false
        vim.keymap.set('n', '<F5>', function()
                if vim.g.isDebugging then 
                    require('dap').continue()
                else
                    vim.cmd("CMakeDebug")
                    vim.g.isDebugging = true
                end
                end)
        end,
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    }
}
