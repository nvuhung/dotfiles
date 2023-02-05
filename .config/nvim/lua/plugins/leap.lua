local leap = require "leap"
leap.init_highlight(true)

leap.setup({
  case_sensitive = true,
  -- disable auto-jumping to the first match
  safe_labels = {},
})

leap.add_default_mappings()
