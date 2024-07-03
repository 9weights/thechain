return {
    {
        "mfussenegger/nvim-dap",
            optional = true,
            dependencies = {
                -- Ensure C/C++ debugger is installed
                    "williamboman/mason.nvim",
                optional = true,
                opts = { ensure_installed = { "codelldb" } },
            },
            config = function()
                local dap = require('dap')
                dap.adapters.cppdbg = {
                    id = 'cppdbg',
                    type = 'executable',
                    command =
                        '/home/vimto/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
                }
        dap.adapters.codelldb = {
            id = "codelldb",
            type = 'server',
            port = "${port}",
            executable = {
                -- CHANGE THIS to your path!
                    command = 
                    '/home/vimto/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
                args = {"--port", "${port}"},

                -- On windows you may have to uncomment this:
                    -- detached = false,
            }
        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
            },
            {
                name = "Launch file lldb",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
            --{
                --    name = 'Attach to gdbserver :1234',
                --    type = 'cppdbg',
                --    request = 'launch',
                --    MIMode = 'gdb',
                --    miDebuggerServerAddress = 'localhost:1234',
                --    miDebuggerPath = '/usr/bin/gdb',
                --    cwd = '${workspaceFolder}',
                --    program = function()
                    --        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    --    end,
                --}
        }
        vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
            vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
            vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
            vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
            vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
            vim.keymap.set('n', '<Leader>lp',
                    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
            vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
            vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
                    require('dap.ui.widgets').hover()
                    end)
            vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
                    require('dap.ui.widgets').preview()
                    end)
            vim.keymap.set('n', '<Leader>df', function()
                    local widgets = require('dap.ui.widgets')
                    widgets.centered_float(widgets.frames)
                    end)
            vim.keymap.set('n', '<Leader>ds', function()
                    local widgets = require('dap.ui.widgets')
                    widgets.centered_float(widgets.scopes)
                    end)
            vim.keymap.set('n', '<Leader>c', function()
                    require('dap').repl.toggle()
                    end)
            end,
            lazy = true,
    },
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                require("dapui").setup({
                        layouts = { {
                        elements = { {
                        id = "scopes",
                        size = 0.25
                        }, {
                        id = "breakpoints",
                        size = 0.25
                        }, {
                        id = "stacks",
                        size = 0.25
                        }, {
                        id = "watches",
                        size = 0.25
                        } },
                        position = "left",
                        size = 70
                        }, {
                        elements = { {
                        id = "repl",
                        size = 0.35
                        }, {
                            id = "console",
                               size = 0.35
                        } },
                        position = "bottom",
                        size = 20
                        } },
                }
            )
                -- Note: Added this <leader>dd duplicate of <F5> because somehow the <F5>
                -- mapping keeps getting reset each time I restart nvim-dap. Annoying but whatever.
                --
                vim.keymap.set(
                        "n",
                        "<leader>dd",
                        function()
                        require("dapui").open() -- Requires nvim-dap-ui

                        vim.cmd [[DapContinue]] -- Important: This will lazy-load nvim-dap
                        end
                        )
                vim.keymap.set('n', '<F17>', function()
                        require('dap').terminate()--disconnect({terminateDebuggee = true})
                        require('dap').close()
                        require('dapui').close()
                        vim.g.isDebugging = false
                        end
                        )
                vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

                local dap, dapui =require("dap"),require("dapui")
                --dap.listeners.after.event_initialized["dapui_config"]=function()
                --    dapui.open()
                --end
                --dap.listeners.before.event_terminated["dapui_config"]=function()
                --    dapui.close()
                --end
                --dap.listeners.before.event_exited["dapui_config"]=function()
                --    dapui.close()
                --end
                dap.listeners.before.attach.dapui_config = function()
                dapui.open()
                end
                dap.listeners.before.launch.dapui_config = function()
                dapui.open()
                end
                dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
                vim.g.isDebugging = false
                end
                dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
                vim.g.isDebugging = false
                end
                end,
                dependencies = {
                    "mfussenegger/nvim-dap",
                    "Civitasv/cmake-tools.nvim"
                },
        },
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {virt_text_win_col = 80, highlight_changed_variables = true},
            config = function()
                require("nvim-dap-virtual-text").setup {
                    enabled = true,                        -- enable this plugin (the default)
                        enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                        highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                        highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                        show_stop_reason = true,               -- show stop reason when stopped for exceptions
                        commented = false,                     -- prefix virtual text with comment string
                        only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
                        all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
                        clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
                        --- A callback that determines how a variable is displayed or whether it should be omitted
                        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
                        --- @param buf number
                        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
                        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
                        --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
                        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
                        display_callback = function(variable, buf, stackframe, node, options)
                        if options.virt_text_pos == 'inline' then
                            return ' = ' .. variable.value
                        else
                            return variable.name .. ' = ' .. variable.value
                                end
                                end,
                                -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
                                    virt_text_pos = vim.fn.has 'nvim-0.10' == 10 and 'inline' or 'eol',

                                -- experimental features:
                                    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                                    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
                                    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
                }
            end,
        },
        {
            "nvim-telescope/telescope-dap.nvim",
            config = function()
                require('telescope').load_extension('dap')
                end,

        },
        {
            "rcarriga/cmp-dap",
            config = function()
                require("cmp").setup({
                        enabled = function()
                        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                        or require("cmp_dap").is_dap_buffer()
                        end
                        })

            require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
                    sources = {
                    { name = "dap" },
                    },
                    })
            end,

        },
}
