vim.keymap.set('n', '<A-F5>', function()
    vim.cmd("CMakeDebug")
end)
vim.keymap.set('n', '<C-F5>', function()
    vim.cmd("CMakeRun")
end)

--vim.keymap.set('n', '<F5>', function()
 --   vim.cmd("CMakeBuild")
  --  --wait
   -- vim.cmd("CMakeDebug")
--end)

vim.keymap.set('n', '<C-B>', function()
    vim.cmd("CMakeBuild")
    -- add feedkeys to autoselect all
end)
