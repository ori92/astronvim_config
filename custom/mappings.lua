local default_opts = {}
local map = vim.keymap.set
local unmap = vim.keymap.del

local unmappings = {
  n = {
    "<b",
    ">b",
    ["<leader>"] = {
      "h",
      "tp",
      "tl",
      "tu",
      "tt",
      "tn",
      "c",
      "fh",
      "u",
      "o",
    },
  },
}

local mappings = {
  n = {
    ["<C-k>"] = { "<cmd>m .-2<CR>", {
      desc = "move line up",
    } },
    ["<C-j>"] = { "<cmd>m .+1<CR>", {
      desc = "move line down",
    } },
    ["n"] = "nzzzv",
    ["N"] = "Nzzzv",
    ["J"] = "mzJ`z",
    ["<C-w>x"] = ":WinShift swap<cr>",
    f = { ":HopChar1CurrentLine<cr>", {
      desc = "Hop 1 Char Current Line",
    } },
    F = { ":HopChar1<cr>", {
      desc = "Hop 1 Char Whole Buf",
    } },
    ["<A-c>"] = { ":VCoolor<cr>", {
      desc = "VCoolor",
    } },
    -- Move to beginning/end of line while in normal mode
    ["<C-a>"] = "^",
    ["<C-e>"] = "$",

    -- Move word to next/prev word
    ["<C-Right>"] = "w",
    ["<C-Left>"] = "b",

    -- C-z for undo
    ["<C-z>"] = "<Cmd>undo<CR>",

    -- Move lines Up/Down using Alt+Arrows
    ["<m-Up>"] = ":m .-2<CR>==",
    ["<m-Down>"] = ":m .+1<CR>==",

    -- Typing gcc is too much (comments toggle)
    ["<C-c>"] = "<Cmd>CommentToggle<CR>",

    -- Alt + Left/Right to move between tabs.
    ["<M-Right>"] = "<Cmd>BufferLineCycleNext<CR>",
    ["<M-Left>"] = "<Cmd>BufferLineCyclePrev<CR>",

    -- Toggle Neotree
    ["\\"] = "<Cmd>Neotree toggle<CR>",

    ["-"] = "<c-x>", -- "Descrement number"
    ["+"] = "<c-a>", -- "Increment number"

    -- Duplicate a line / selection and comment out the first
    ["<Leader>C"] = { "Ypk:CommentToggle<CR>j", { desc = "Duplicate comment" } },

    -- Insert current date
    ["<Leader>i"] = { '"=strftime("%b %d, %Y")<CR>p', { desc = "insert date " } },

    -- Select panes (tmux integration)
    ["<Leader><Up>"] = "<cmd>lua require('tmux').move_top()<cr>",
    ["<Leader><Down>"] = "<cmd>lua require('tmux').move_bottom()<cr>",
    ["<Leader><Left>"] = "<cmd>lua require('tmux').move_left()<cr>",
    ["<Leader><Right>"] = "<cmd>lua require('tmux').move_right()<cr>",

    -- Disable ex mode mapping
    ["Q"] = "<Nop>",
    ["q:"] = "<Nop>", -- not working

    -- Cheatsheet
    ["<Leader>?"] = "<Cmd>Cheatsheet<CR>",

    -- <esc> to clear search highlight
    ["<esc>"] = "<Cmd>nohlsearch<CR>",
  },

  v = {
    ["<C-j>"] = ":m '>+1<cr>gv=gv",
    ["<C-k>"] = ":m '<-2<cr>gv=gv",

    -- Move lines Up/Down using Alt+Arrows
    ["<C-Up>"] = ":m '<-2<CR>gv=gv",
    ["<C-Down>"] = ":m '>+1<CR>gv=gv",

    -- Typing gcc is too much (comments toggle)
    ["<C-c>"] = ":CommentToggle<CR>gv",
  },
  i = {
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
    ["!"] = "!<c-g>u",
    ["?"] = "?<c-g>u",

    -- Move to beginning/end of line while in insert mode
    ["<C-a>"] = "<C-o>0",
    ["<C-e>"] = "<C-o>$",

    -- Move Cursor in insert mode
    ["<C-l>"] = "<Right>",
    ["<C-h>"] = "<Left>",
    ["<C-k>"] = "<Up>",
    ["<C-j>"] = "<Down>",

    -- C-z for undo
    ["<C-z>"] = "<ESC>ui",

    -- Move lines Up/Down using Alt+Arrows
    ["<m-Up>"] = ":m .-2<CR>==",
    ["<m-Down>"] = ":m .+1<CR>==",

    -- Typing gcc is too much (comments toggle)
    ["<C-c>"] = "<cmd>CommentToggle<CR>",
  },
}

-- Trying to make my mappings which-key style
for mode, maps in pairs(mappings) do
  for lhs, rhs in pairs(maps) do
    if type(rhs) == "string" or type(rhs) == "function" then
      map(mode, lhs, rhs, default_opts)
    elseif type(rhs) == "table" then
      if type(rhs.name) == "string" then
        for key, value in pairs(rhs) do
          if key ~= "name" then
            map(mode, lhs .. key, value[1], {
              desc = value[2],
            })
          end
        end
      else
        map(mode, lhs, rhs[1], rhs[2])
      end
    end
  end
end

for mode, unmaps in pairs(unmappings) do
  for prefix, key in pairs(unmaps) do
    if type(key) == "table" then
      for _, key_child in pairs(key) do
        unmap(mode, prefix .. key_child)
      end
    else
      unmap(mode, key)
    end
  end
end

-- Abbreviations
local abbreviations = {
  Wq = "wq",
  WQ = "wq",
  Wqa = "wqa",
  W = "w",
  Q = "q",
  Qa = "qa",
  wrap = "set wrap",
  nowrap = "set nowrap",
}

for left, right in pairs(abbreviations) do
  vim.cmd(string.format("cnoreabbrev %s %s", left, right))
end
