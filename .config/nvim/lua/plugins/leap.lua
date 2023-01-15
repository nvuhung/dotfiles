  local leap = require "leap"
  leap.init_highlight(true)

  leap.setup({ 
    case_sensitive = false,
    -- disable auto-jumping to the first match
    safe_labels = {},
  })
