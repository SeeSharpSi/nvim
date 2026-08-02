return {
  "tpope/vim-fugitive",
  keys = {
    {
      "<leader>gs",
      function()
        if vim.bo.filetype == "fugitive" then
          vim.cmd.bdelete()
        else
          vim.cmd.Git()
        end
      end,
      desc = "Toggle Git Status",
    },
  },
}
