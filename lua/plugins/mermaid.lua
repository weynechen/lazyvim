-- npm install -g @mermaid-js/mermaid-cli
-- 自适应: 按终端窗口大小动态计算 mermaid 图表渲染尺寸上限
-- snacks.image 的 max_width/max_height 是渲染盒的硬上限(单元格数):
--   固定值在窄/宽、矮/高的终端上都不合适, 这里让它们跟随终端尺寸变化。
-- 原理: snacks 先以 "终端尺寸(与窗口取小)" 作为渲染盒, 再用 max_* 做上限裁剪,
--       最后按图片原始宽高比缩放(只缩小不放大)。因此按终端比例取值即可自适应。
local function image_limits()
  return {
    -- 宽度: 终端列数的 60%, 限制在 [80, 160] 之间 (避免过宽/过窄)
    max_width = math.min(160, math.max(80, math.floor(vim.o.columns * 0.6))),
    -- 高度: 终端行数的 50%, 至少 30 行
    max_height = math.max(30, math.floor(vim.o.lines * 0.5)),
  }
end

-- 终端窗口尺寸变化时实时更新限制
-- (已渲染的图片会在下次滚动/重绘/悬停时自动套用新尺寸)
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    local ok, snacks = pcall(require, "snacks")
    if ok and snacks and snacks.image and snacks.image.config then
      local limits = image_limits()
      snacks.image.config.doc.max_width = limits.max_width
      snacks.image.config.doc.max_height = limits.max_height
    end
  end,
})

return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.image = vim.tbl_deep_extend("force", opts.image or {}, {
        enabled = true,
        doc = vim.tbl_deep_extend(
          "force",
          opts.image and opts.image.doc or {},
          {
            -- render mermaid/math blocks inline instead of only on hover
            inline = true,
            float = true,
          },
          image_limits()
        ),
        convert = {
          notify = true, -- surface mmdc failures instead of silently showing nothing
        },
      })
      return opts
    end,
  },
  {
    -- render-markdown draws its own concealed code block for ```mermaid,
    -- which fights with the image snacks puts there. Let snacks own it.
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      code = {
        disable_background = { "mermaid" },
      },
    },
  },
}
