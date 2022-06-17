if vim.g.colors_name == "darkplus" then
  local darkplus = require "darkplus.palette"
  return {
    theme = { bg = darkplus.dark, fg = darkplus.fg },
  }
elseif vim.g.colors_name == "catppuccin" then
  local components = require "catppuccin.core.integrations.feline"
  local catppuccin = require("catppuccin.api.colors").get_colors() -- fetch colors with API
  components.active[1][11]["provider"] = "line_percentage"
  components.active[1][10]["provider"] = function()
    return " " .. "CWD: " .. vim.fn.getcwd():gsub("/home/ori", "~") .. " "
  end
  components.active[1][10]["hl"] = { fg = catppuccin.text, bg = catppuccin.surface0 }

  return function()
    return {
      components = components,
    }
  end
else
  return {}
end
