return {
    {"williamboman/mason.nvim",
    },
    {"jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason").setup()
            require("mason-nvim-dap").setup({
                ensure_installed = {"cppdbg", "codelldb", "rust-analyser"}
            })
        end,
    },
}
