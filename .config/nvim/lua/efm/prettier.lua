return {
    -- npm install -g @fsouza/prettierd
    -- formatCommand = 'prettierd ${INPUT}',
    -- formatStdin = true,
    -- env = {
    --   string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('/.config/nvim/lua/efm/.prettierrc.json')),
    -- },

    formatCommand = 'prettierd "${INPUT}"',
    formatStdin = true,
    env = {
      string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('/.config/nvim/lua/efm/.prettierrc.json')),
    },
    -- }

    -- formatCommand = ([[
    --     ./node_modules/.bin/prettier
    --     ${--config-precedence:configPrecedence}
    --     ${--tab-width:tabWidth}
    --     ${--single-quote:singleQuote}
    --     ${--trailing-comma:trailingComma}
    -- ]]):gsub(
    --     "\n",
    --     ""
    -- )
}
