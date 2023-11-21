return {
  "echasnovski/mini.pairs",
  opts = {
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]%W" },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]%W" },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]%W" },

      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

      ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\]%W", register = { cr = false } },
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\]%W", register = { cr = false } },
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\]%W", register = { cr = false } },
    },
  },
}
