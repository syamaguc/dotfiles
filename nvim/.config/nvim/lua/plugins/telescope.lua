return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({ cwd = "~/config/", hidden = true })
        end,
        desc = "Find Config File",
      },
    },
  },
  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
