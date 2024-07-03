require("mfdoom.remap")
require("mfdoom.lazyvim")
require("mfdoom.set")
require("mfdoom.terminal")
require("mfdoom.centreScreen")
require("mfdoom.cmakemaker")
require("mfdoom.gitMacros")
require("mfdoom.shortcuts")
require("mfdoom.undofile")
vim.cmd[[colorscheme monokai-charcoal]]
--vim.cmd[[colorscheme tokyonight]]
vim.api.nvim_create_autocmd({"VimLeave", "VimSuspend"}, {  
    callback = function()
        --vim.cmd("hi Cursor guifg=white guibg=white")
        vim.opt.guicursor="n-v-c-sm-i-ci-ve:ver1,a:blinkwait700-blinkoff400-blinkon250-nCursor/lCursor"
        --&t_me= "\<Esc>]50;CursorShape=1\x7"
    end,
  } 
)
