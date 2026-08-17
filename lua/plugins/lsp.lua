-- Marksman indexes every Markdown file in the workspace. Skip it in
-- doc-heavy repos; keep it for ordinary projects. `.marksman.toml` at
-- the root force-enables, `.nomarksman` force-disables.
local MARKSMAN_MD_LIMIT = 200
local marksman_root_ok = {}

---@param root string
---@return boolean
local function marksman_should_start(root)
  local cached = marksman_root_ok[root]
  if cached ~= nil then
    return cached
  end

  if vim.uv.fs_stat(vim.fs.joinpath(root, ".nomarksman")) then
    marksman_root_ok[root] = false
    return false
  end
  if vim.uv.fs_stat(vim.fs.joinpath(root, ".marksman.toml")) then
    marksman_root_ok[root] = true
    return true
  end

  local result = vim.system({ "git", "-C", root, "ls-files", "-z", "--", "*.md", "*.mdx" }, { text = true }):wait()
  local count = 0
  if result.code == 0 and result.stdout ~= "" then
    for _ in result.stdout:gmatch("%z") do
      count = count + 1
    end
  end

  local ok = count <= MARKSMAN_MD_LIMIT
  marksman_root_ok[root] = ok
  if not ok then
    vim.notify(
      string.format(
        "Marksman skipped: %d markdown files in %s (limit %d). Add .marksman.toml to force-enable.",
        count,
        root,
        MARKSMAN_MD_LIMIT
      ),
      vim.log.levels.INFO
    )
  end
  return ok
end

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
        marksman = {
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            if fname == "" then
              return
            end
            local root = vim.fs.root(fname, { ".marksman.toml", ".git" })
            if root and marksman_should_start(root) then
              on_dir(root)
            end
          end,
        },
      },
      -- 3. 告诉 Mason 自动安装这些
      setup = {
        -- 如果你想确保 pyright 彻底不干扰，可以在这里做额外拦截
      },
    },
  },
}
