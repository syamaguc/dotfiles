return {
  {
    -- SKK
    "vim-skk/skkeleton",
    dependencies = { "vim-denops/denops.vim" },
    config = function()
      vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(skkeleton-toggle)", { noremap = true })
      vim.api.nvim_set_keymap("c", "<C-j>", "<Plug>(skkeleton-toggle)", { noremap = true })
      vim.api.nvim_exec(
        [[
                call skkeleton#config({
                    \  'eggLikeNewline': v:true,
                    \  'globalDictionaries': ['~/.config/nvim/skk/SKK-JISYO.L', 'euc-jp'],
                    \ })
            ]],
        false
      )
    end,
  },
  --
  {
    "delphinus/skkeleton_indicator.nvim",
    config = function()
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorEiji", { fg = "#88c0d0", bg = "#2e3440", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorHira", { fg = "#2e3440", bg = "#a3be8c", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorKata", { fg = "#2e3440", bg = "#ebcb8b", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorHankata", { fg = "#2e3440", bg = "#b48ead", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorZenkaku", { fg = "#2e3440", bg = "#88c0d0", bold = true })
      vim.api.nvim_set_hl(0, "SkkeletonIndicatorAbbrev", { fg = "#e5e9f0", bg = "#bf616a", bold = true })
      require("skkeleton_indicator").setup({})
    end,
  },
  -- override nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "vim-skk/skkeleton", "uga-rosa/cmp-skkeleton" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "skkeleton" } }))
    end,
  },
}
