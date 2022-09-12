local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = false,
  triggers = "auto",
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  silent = true,
  noremap = true,
}

local mappings = {
  ["t"] = {
    name = "File Explorer",
    ["t"] = { "<cmd>NvimTreeToggle<CR>", "Toggle" },
    ["r"] = { "<cmd>NvimTreeRefresh<CR>", "Refresh" },
    ["c"] = { "<cmd>NvimTreeClose<CR>", "Close" },
    ["o"] = { "<cmd>NvimTreeCollapse<CR>", "Collapse" },
  },
  ["b"] = {
    name = "Buffers",
    ["l"] = { "<cmd>BufferLineCloseRight<CR>", "Close all to right" },
    ["h"] = { "<cmd>BufferLineCloseLeft<CR>", "Close all to left" },
  }
}

require('which-key').setup(setup)
require('which-key').register(mappings, opts)

