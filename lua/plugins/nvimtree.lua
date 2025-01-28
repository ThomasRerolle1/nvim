-- return {
--   "nvim-tree/nvim-tree.lua",
--   opts = {
--     git = {
--       enable = true,
--       ignore = true,  -- Ceci activera la prise en compte du .gitignore
--     },
--     filters = {
--       git_ignored = true,  -- Ceci masquera les fichiers .gitignore
--     },
--   },
-- }
--
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    filters = {
      git_ignored = true,
    },
  },
}
