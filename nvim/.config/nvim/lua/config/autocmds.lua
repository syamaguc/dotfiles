-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- close window q & <ESC>
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "man",
    "lspinfo",
    "lspsaga",
    "spectre_panel",
    "DressingSelect",
    "Markdown",
  },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <esc> :close<CR> 
      set nobuflisted 
    ]])
  end,
})

-- highlight when yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

-- Ctrl + P
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd([[
      nnoremap <silent><expr><C-P> (expand('%') =~ 'NERD_tree' ? "\<C-W>\<C-W>" : '').":FzfLua files<CR>"
    ]])
  end,
})

-- find word
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd([[
     nnoremap <leader>fw :lua require('fzf-lua').grep_cword()<CR>
    ]])
  end,
})
