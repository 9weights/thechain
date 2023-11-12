vim.keymap.set('n',"<leader>pa", function()
    gitUser = "9weights"
    gitKey = "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"
    fireExit = vim.api.nvim_replace_termcodes("<C-c>", false, false, true)
    carRet = vim.api.nvim_replace_termcodes("<CR>", false, false, true)
    vim.api.nvim_feedkeys("i" .. gitUser .. carRet, 'n', false)
    vim.api.nvim_feedkeys(gitKey .. carRet, 'n', false)
    --vim.cmd("call feedkeys('i" .. gitUser .. carRet"')")
    --vim.cmd("call feedkeys('i" .. gitKey .. carRet"')")
    --vim.cmd.chansend(window_channel, "ls\n" )
    --window_channel = vim.fn.jobpid(vim.o.channel)
    --vim.cmd(call feedkeys(gitUser .. '<cr>'))
    --vim.cmd(call feedkeys(gitKey .. "<cr>"))
end)

