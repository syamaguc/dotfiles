-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- options
local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--- smart quit
local smart_quit = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes.(w/q) ",
    }, function(input)
      if input == "w" then
        vim.cmd("w")
        vim.cmd("q")
      elseif input == "q" then
        vim.cmd("q!")
      end
    end)
  else
    vim.cmd("q!")
  end
end

--- Smart quit
keymap("n", "<leader><ESC>", "", { callback = smart_quit })
keymap("n", "<leader>q", "", { callback = smart_quit })

-- Sudo Save
keymap("c", "W", "w !sudo tee % > /dev/null<CR>", opts)
