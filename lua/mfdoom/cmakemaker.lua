vim.api.nvim_create_user_command("MakeCMake",function()
    executableName = vim.fn.input("Executable name: ")
    if (executableName == "") then
        executableName = "sadge"
    end

    projectName = ""
    if (projectName == "") then
        projectName = executableName
    end


    vim.cmd("new CMakeLists.txt")
    vim.api.nvim_set_current_line("cmake_minimum_required(VERSION 3.10)")
    vim.cmd('norm! o')
    vim.api.nvim_set_current_line("project(" .. projectName .. ")")
    vim.cmd('norm! o')
    vim.api.nvim_set_current_line("set(CMAKE_EXPORT_COMPILE_COMMANDS ON)")
    vim.cmd('norm! o')

    vim.api.nvim_set_current_line("add_executable(" .. executableName .. " main.cpp)")
    vim.cmd("w")
    vim.cmd("wincmd c")
    vim.cmd("wincmd p")
    vim.cmd("Ntree")
   -- vim.cmd('norm! <c-l>')
end,{})

vim.api.nvim_create_user_command("MakeGitIgnore",function()
    vim.cmd("new .gitignore")
    vim.api.nvim_set_current_line("out/")
    vim.cmd('norm! o')
    vim.api.nvim_set_current_line("compile_commands.json")
    vim.cmd('norm! o')
    vim.api.nvim_set_current_line(".cache/")
    vim.cmd("w")
    vim.cmd("wincmd c")
    vim.cmd("wincmd p")
    vim.cmd("Ntree")
end,{})

vim.api.nvim_create_user_command("MCM",function()
    vim.cmd("MakeCMake")
    vim.cmd("CMakeGenerate")
end,{})
