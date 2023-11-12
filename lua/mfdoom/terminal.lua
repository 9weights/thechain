vim.g.termId = 0
vim.keymap.set("n", "<leader>zv", function()
    if vim.g.termId == 0 then
        --dir = vim.cmd("echo @%")
        vim.cmd("botright split")
        vim.cmd("wincmd b")
        vim.g.termId = vim.fn.win_getid()
        vim.fn.win_execute(vim.g.termId,"term")
        vim.fn.win_execute(vim.g.termId,"res 10")
        vim.cmd("start")
        --vim.cmd("norm A cd " .. dir)
        --vim.cmd("term")
        --vim.cmd("wincmd j")
        --vim.cmd("wincmd K")
        --vim.cmd("2res 10")
    else 
        --termWin = vim.fn.win_id2win(vim.g.termId)
        --vim.fn.execute(termWin,"wincmd c")
        vim.fn.win_execute(vim.g.termId,"wincmd c")
        vim.g.termId = 0
        vim.fn.win_execute(vim.g.termId,"wincmd p")
        


    end
    --vim.fn.win_execute(tempid,vim.cmd("wincmd K"))
end)
vim.keymap.set("t", "<C-c>","<C-\\><C-n>")
