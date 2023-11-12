vim.g.leftPadId = 0
vim.g.rightPadId = 0
vim.api.nvim_create_user_command("CentreScreen",function()
    size = 60
    if vim.g.leftPadId == 0 then
        vim.cmd("vertical topleft new")
        vim.cmd("vertical botright split")
        vim.g.leftPadId = vim.fn.win_getid(1)
        vim.g.rightPadId = vim.fn.win_getid(3)
        vim.fn.win_execute(vim.g.rightPadId,"setlocal nonumber")
        vim.fn.win_execute(vim.g.leftPadId,"setlocal nonumber")
        vim.fn.win_execute(vim.g.rightPadId,"setlocal norelativenumber")
        vim.fn.win_execute(vim.g.leftPadId,"setlocal norelativenumber")
        vim.fn.win_execute(vim.g.rightPadId,"vert res " .. size)
        vim.fn.win_execute(vim.g.leftPadId,"vert res " .. size)
        vim.cmd("wincmd h")
    else 
        vim.fn.win_execute(vim.g.leftPadId,"wincmd c")
        vim.fn.win_execute(vim.g.rightPadId,"wincmd c")
        vim.g.leftPadId = 0
        vim.g.rightPadId = 0
        vim.fn.win_execute(vim.g.termId,"wincmd p")
    end
end,{})
vim.keymap.set("n", "<leader>iw", vim.cmd.CentreScreen)
vim.keymap.set("n", "<leader>sh", vim.cmd("set ls=0"))
-- Clean numbers and transparent bar
--vim.cmd("set fillchars=vert:│,fold:┈,diff:┈")
