return {
  -- Customize snacks.nvim dashboard
  {
    "folke/snacks.nvim",
    opts = {
      -- Increase big file threshold (default: 1.5MB)
      bigfile = {
        size = 5 * 1024 * 1024, -- 5MB
      },
      dashboard = {
        preset = {
          header = [[
 _._     _,-'""`-._
(,-.`._,'(       |\`-/|
    `-.-' \ )-`( , o o)
          `-    \`_`"'-
        
         Hi    Weyne 
]],
        },
      },
      -- Enable image support
      image = {
        enabled = true,
      },
      -- Configure picker explorer layout width
      picker = {
        sources = {
          explorer = {
            layout = {
              layout = {
                width = 30, -- Fixed width in columns (default: 40, adjust as needed)
                -- width = 0.2, -- Or use relative width (20% of screen width)
              },
            },
          },
        },
      },
    },
  },
}
