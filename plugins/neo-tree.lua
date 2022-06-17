return {
  close_if_last_window = true,
  enable_diagnostics = true,
  enable_git_status = true,
  filesystem = {
    filtered_items = {
      hide_dotfiles = true,
      hide_by_pattern = {},
      hide_by_name = {},
      never_show = {
        ".DS_Store",
        "thumbs.db",
        "node_modules",
        ".git",
        ".cache",
      },
    },
  },
  window = {
    mapping = {},
    position = "right",
    width = 30,
  },
}
