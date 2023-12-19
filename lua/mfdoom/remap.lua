vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- mass move and auto indent
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- stationary cursor whilst J
vim.keymap.set("n", "<C-d>", "<C-d>zz") --  dunno
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")



-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- void and paste

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- yank to sys clipboard

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- void and delete

vim.keymap.set("i", "<C-c>", "<Esc>") -- for mass edit (only esc works normally)

vim.keymap.set("n", "Q", "<nop>") -- dunno
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- find tmux?
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") error stuff?
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) makes file executable

--My remaps--

--vim.keymap.set("i", "<C-i>", "<C-n>")
vim.keymap.set("i", "<A-h>", "<Left>")
vim.keymap.set("i", "<A-j>", "<Down>")
vim.keymap.set("i", "<A-k>", "<Up>")
vim.keymap.set("i", "<A-l>", "<Right>")


vim.keymap.set("n", "<leader>cm", function()
    vim.cmd("CMakeClose")
    end)
