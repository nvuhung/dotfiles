return function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local lspconfig = require "lspconfig"

  local map = function(mode, key, result, noremap, expr)
      if noremap == nil then
          noremap = true
      end
      if expr == nil then
          expr = false
      end
      vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = noremap, silent = true, expr = expr})
  end

  -- Icons
  vim.lsp.protocol.CompletionItemKind = {
      " [text]",
      " [method]",
      " [function]",
      " [constructor]",
      "ﰠ [field]",
      " [variable]",
      " [class]",
      " [interface]",
      " [module]",
      " [property]",
      " [unit]",
      " [value]",
      " [enum]",
      " [key]",
      "﬌ [snippet]",
      " [color]",
      " [file]",
      " [reference]",
      " [folder]",
      " [enum member]",
      " [constant]",
      " [struct]",
      "⌘ [event]",
      " [operator]",
      "♛ [type]"
  }

  vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

  vim.lsp.handlers["textDocument/formatting"] = function(_, result, ctx, _)
      if not result then return end
      if not vim.api.nvim_buf_get_option(ctx.bufnr, "modified") then
          local view = vim.fn.winsaveview()
          vim.lsp.util.apply_text_edits(result, ctx.bufnr, "utf-16")

          vim.fn.winrestview(view)
          if ctx.bufnr == vim.api.nvim_get_current_buf() then
              vim.cmd [[noautocmd :update]]
          end
      end
  end

--   vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
--       vim.lsp.with(
--           vim.lsp.diagnostic.on_publish_diagnostics,
--           {
--               underline = true,
--               update_in_insert = false
--           }
--       )(...)
--       pcall(vim.lsp.diagnostic.set_loclist, {open_loclist = false})
--   end

  -- Prettier
  local format_options_prettier = {
      tabWidth = 2,
      singleQuote = true,
      trailingComma = "all",
      configPrecedence = "prefer-file"
  }
  vim.g.format_options_typescript = format_options_prettier
  vim.g.format_options_javascript = format_options_prettier
  vim.g.format_options_typescriptreact = format_options_prettier
  vim.g.format_options_javascriptreact = format_options_prettier
  vim.g.format_options_json = format_options_prettier
  vim.g.format_options_css = format_options_prettier
  vim.g.format_options_scss = format_options_prettier
  vim.g.format_options_less = format_options_prettier
  -- vim.g.format_options_html = format_options_prettier
  vim.g.format_options_yaml = format_options_prettier
  vim.g.format_options_markdown = format_options_prettier

  FormatToggle = function(value)
      vim.g[string.format("format_disabled_%s", vim.bo.filetype)] = value
  end
  vim.cmd [[command! FormatDisable lua FormatToggle(true)]]
  vim.cmd [[command! FormatEnable lua FormatToggle(false)]]

  _G.formatting = function()
      if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
          vim.lsp.buf.format(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
      end
  end

  local on_attach = function(client)
      if client.server_capabilities.documentFormattingProvider then
          vim.cmd [[augroup Format]]
          vim.cmd [[autocmd! * <buffer>]]
          vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
          vim.cmd [[augroup END]]
      end
      if client.server_capabilities.definitionProvider then
          map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
      end
      if client.server_capabilities.hoverProvider then
          map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
      end
      if client.server_capabilities.renameProvider then
          map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
      end

      map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
      map('n', '<C-e>', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
      map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
      map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
      map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
      map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
      map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
      map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
      map('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>')
      map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
      map('n', '<space>s', '<cmd>lua vim.diagnostic.open_float()<CR>')
      map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
      map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
      map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

  end

  -- https://github.com/golang/tools/tree/master/gopls
  -- lspconfig.gopls.setup {
  --     on_attach = function(client)
  --         client.server_capabilities.documentFormattingProvider = false
  --         on_attach(client)
  --     end
  -- }

  -- https://github.com/palantir/python-language-server
  -- lspconfig.pyls.setup {
  --     on_attach = on_attach,
  --     settings = {
  --         pyls = {
  --             plugins = {
  --                 pycodestyle = {
  --                     enabled = false,
  --                     ignore = {
  --                         "E501"
  --                     }
  --                 }
  --             }
  --         }
  --     }
  -- }
  -- lspconfig.pyright.setup {on_attach = on_attach}

  -- https://github.com/theia-ide/typescript-language-server
  lspconfig.tsserver.setup {
      on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          on_attach(client)
      end
  }

  -- https://github.com/iamcco/vim-language-server
  -- lspconfig.vimls.setup {on_attach = on_attach}

  -- https://github.com/vscode-langservers/vscode-json-languageserver
  lspconfig.jsonls.setup {
      on_attach = on_attach,
      cmd = { "vscode-json-languageserver", "--stdio" }
  }

  -- https://github.com/vscode-langservers/vscode-css-languageserver-bin
  lspconfig.cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  -- https://github.com/vscode-langservers/vscode-html-languageserver-bin
  lspconfig.html.setup {
    capabilities = capabilities,
    on_attach = on_attach
  }

  -- https://github.com/bash-lsp/bash-language-server
  lspconfig.bashls.setup {on_attach = on_attach}

  -- https://github.com/sveltejs/language-tools/tree/master/packages/language-server
  -- npm install -g svelte-language-server
  lspconfig.svelte.setup {on_attach = on_attach}

  -- https://github.com/tailwindlabs/tailwindcss-intellisense
  -- npm install -g @tailwindcss/language-server
  lspconfig.tailwindcss.setup {on_attach = on_attach}

  -- npm install -g @prisma/language-server
  lspconfig.prismals.setup {on_attach = on_attach}

  -- https://github.com/withastro/language-tools/tree/main/packages/language-server
  -- lspconfig.astro.setup {on_attach = on_attach}
  lspconfig.astro.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "astro-ls", "--stdio" },
      filetypes = { "astro" }
  }

  -- https://github.com/prisma/language-tools
  lspconfig.prismals.setup {on_attach = on_attach}


  -- https://github.com/bmatcuk/stylelint-lsp
  -- lspconfig.stylelint_lsp.setup {on_attach = on_attach}
  lspconfig.stylelint_lsp.setup {
      on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          on_attach(client)
      end
  }

  -- local golint = require "efm/golint"
  -- local goimports = require "efm/goimports"
  -- local black = require "efm/black"
  -- local isort = require "efm/isort"
  -- local flake8 = require "efm/flake8"
  -- local mypy = require "efm/mypy"
  -- local shellcheck = require "efm/shellcheck"
  -- local misspell = require "efm/misspell"
  local prettier = require "efm/prettier"
  local eslint = require "efm/eslint"

  -- https://github.com/mattn/efm-langserver
  local efm_config = {
    -- ["="] = {misspell},
    -- go = {golint, goimports},
    -- python = {black, isort, flake8, mypy},
    -- sh = {shellcheck},
    typescript = {prettier, eslint},
    javascript = {prettier, eslint},
    typescriptreact = {prettier, eslint},
    javascriptreact = {prettier, eslint},
    yaml = {prettier},
    json = {prettier},
    -- html = {prettier},
    scss = {prettier},
    less = {prettier},
    css = {prettier},
    markdown = {prettier},
  }
  lspconfig.efm.setup {
      on_attach = on_attach,
      init_options = {documentFormatting = true, codeAction = true},
      filetypes = vim.tbl_keys(efm_config),
      -- set log not working
      settings = {
        rootMarkers = {".git/"},
        languages = efm_config
      }
  }

  -- lspconfig.clangd.setup {on_attach = on_attach}
end
