vim.api.nvim_create_user_command("MakeCMake",function()
    vim.cmd("new CMakeLists.txt")
    vim.api.nvim_set_current_line("cmake_minimum_required(VERSION 3.10)")
    vim.cmd('norm! o')
    vim.api.nvim_set_current_line("project(Sadge)")
    vim.cmd('norm! o')
    vim.api.nvim_set_current_line("set(CMAKE_EXPORT_COMPILE_COMMANDS ON)")
    vim.cmd('norm! o')
    vim.api.nvim_set_current_line("add_executable(sadge main.cpp)")
    vim.cmd("w")
    vim.cmd("wincmd c")
    vim.cmd("wincmd p")
    vim.cmd("Ntree")
   -- vim.cmd('norm! <c-l>')
end,{})

vim.api.nvim_create_user_command("MCM",function()
    vim.cmd("MakeCMake")
    vim.cmd("CMakeGenerate")
end,{})