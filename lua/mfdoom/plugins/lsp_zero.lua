return{
    {'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)
            lsp_zero.setup_servers({'lua_ls', 'jedi_language_server', 'clangd', 'rust_analyser'})
        end
    },
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
}
