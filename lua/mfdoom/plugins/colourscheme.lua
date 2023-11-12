return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
    config = function()
        vim.cmd([[colorscheme tokyonight-night]])
    end,
}
--return {
--	"rose-pine/neovim",
--	name = "rose-pine",
--	lazy = false,
--	priority = 1000,
--	opts = {},
--	config = function() 
		--vim.cmd([[colorscheme seoul256]])
	--end,

--}
--return {
--	"junegunn/seoul256.vim",
--	name = "seoul256",
--	lazy = false,
--	priority = 1000,
--	opts = {},
--	config = function() 
--		vim.cmd([[colorscheme seoul256]])
--	end,
--}
