vim.keymap.set('n', '<F53>', function()-- alt f5
    vim.cmd("CMakeDebug")
end)
vim.keymap.set('n', '<F29>', function()-- ctrl f5
    vim.cmd("CMakeRun")
end)

--vim.keymap.set('n', '<F5>', function()
 --   vim.cmd("CMakeBuild")
  --  --wait
   -- vim.cmd("CMakeDebug")
--end)

vim.keymap.set('n', '<c-b>', function()
    vim.cmd("CMakeBuild")
    -- add feedkeys to autoselect all
end)
