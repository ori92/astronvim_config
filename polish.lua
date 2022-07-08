return function()
  require "user.custom.tmux"
  require "user.custom.ui"

  -- FileType
  vim.filetype.add {
    extension = {
      rasi = "rasi",
      conf = "config",
    },
  }
end
