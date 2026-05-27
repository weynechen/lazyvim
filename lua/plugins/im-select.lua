return {
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({
        default_command = "fcitx5-remote",
        default_im_select = "keyboard-us",
        keep_quiet_on_no_binary = true,
      })
    end,
  },
}
