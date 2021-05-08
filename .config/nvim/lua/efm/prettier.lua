return {
    -- npm install -g @fsouza/prettierd
    formatCommand = 'prettierd ${INPUT}', formatStdin = true

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
