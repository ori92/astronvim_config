local highlights = {}

highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.treesitter", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.base", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.rainbow", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.bufferline", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.lsp", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.diagnostics", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.telescope", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.notify", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.neo_tree", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.dev_icon", highlights)

return highlights