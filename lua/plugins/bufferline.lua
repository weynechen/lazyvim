return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    -- Override the default highlights to make unselected tabs gray
    opts.highlights = {
      buffer_selected = {
        fg = "#FFFFFF",
        bold = true,
      },
      -- Unselected tabs: gray
      buffer = {
        fg = "#808080",
      },
      background = {
        fg = "#808080",
      },
      -- Warning states: also gray
      warning = {
        fg = "#808080",
      },
      warning_visible = {
        fg = "#808080",
      },
      warning_diagnostic = {
        fg = "#808080",
      },
      warning_diagnostic_visible = {
        fg = "#808080",
      },
      -- Error states: keep original or set to gray
      error = {
        fg = "#808080",
      },
      error_visible = {
        fg = "#808080",
      },
      error_diagnostic = {
        fg = "#808080",
      },
      error_diagnostic_visible = {
        fg = "#808080",
      },
      -- Info/Hint states
      info = {
        fg = "#808080",
      },
      info_visible = {
        fg = "#808080",
      },
      hint = {
        fg = "#808080",
      },
      hint_visible = {
        fg = "#808080",
      },
    }
    return opts
  end,
}
