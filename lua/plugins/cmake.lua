return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      -- disable cmake linter
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.cmake = {}
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- disable cmake-language-server (has dependency issues)
        cmake = false,
        -- use neocmakelsp instead
        neocmakelsp = {},
      },
    },
    init = function()
      -- Override LSP diagnostic handler to filter formatting warnings
      local original_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        if result and result.diagnostics then
          -- Filter out formatting warnings by checking message content
          result.diagnostics = vim.tbl_filter(function(diagnostic)
            if diagnostic.message then
              -- Keep diagnostic if it's NOT a formatting warning
              return not (
                diagnostic.message:match("%[C0303%]") -- Trailing whitespace
                or diagnostic.message:match("%[C0307%]") -- Bad indentation
                or diagnostic.message:match("%[C0301%]") -- Line too long
              )
            end
            return true
          end, result.diagnostics)
        end
        original_handler(err, result, ctx, config)
      end
    end,
  },
}
