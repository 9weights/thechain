return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        "debugloop/telescope-undo.nvim"},
        keys = {
            --1	{"<leader>pf",Util.telescope("find_files")},
            --1	{"<C-p>",Util.telescope("git_files")},
            --1	{"<leader>ps",function()
            --1		Util.telescope("grep_string")({ search = vim.fn.input("Grep > ") })end}
            { "<leader>sh", "<cmd>Telescope help_tags<cr>"},
            { "<leader>pf", "<cmd>Telescope find_files<cr>"},
            { "<leader>ps", "<cmd>Telescope live_grep<cr>"},
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    undo = {
                        side_by_side = true,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.8,
                        },
                    },
                },
            })
            require("telescope").load_extension("undo")
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end

    }
    --return {
    --	'nvim-telescope/telescope.nvim', tag = '0.1.4',
    --	dependencies = { 'nvim-lua/plenary.nvim' },
    --	config = {
    --		local builtin = require('telescope.builtin')
    --		vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    --		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    --		vim.keymap.set('n', '<leader>ps', function()
    --			builtin.grep_string({ search = vim.fn.input("Grep > ") });end)
    --		}
    --	}
