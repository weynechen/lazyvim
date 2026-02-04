return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = {
          settings = {
            ty = {
              diagnosticMode = "workspace",
            },
          },
        },
        -- 2. 禁用 pyright
        pyright = {
          enabled = false, -- 核心：让 LazyVim 不去启动它
        },
      },
      -- 3. 告诉 Mason 自动安装这些
      setup = {
        -- 如果你想确保 pyright 彻底不干扰，可以在这里做额外拦截
      },
    },
  },
}
