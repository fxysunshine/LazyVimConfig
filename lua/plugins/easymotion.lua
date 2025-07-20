return {
  {
    "easymotion/vim-easymotion",
    config = function()
      vim.g.EasyMotion_leader_key = "<leader><leader>"

      vim.g.EasyMotion_do_mapping = 0
      vim.g.EasyMotion_smartcase = 1

      vim.cmd([[
        highlight EasyMotionTarget guifg=white guibg=red
        highlight EasyMotionShade guifg=grey guibg=NONE
      ]])
    end,
  },
}
