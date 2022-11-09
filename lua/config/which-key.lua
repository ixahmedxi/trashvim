import("which-key", function (whichKey)
  local setup = {
    window = {
      border = "rounded",
      position = "bottom",
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0,
    },
    ignore_missing = true,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
  }

  local opts = {
    mode = "n",
    prefix = "<leader>",
    silent = true,
    noremap = true
  }

  local mappings = {
    ["w"] = { "<cmd>w<cr>", "Save" },
    ["q"] = { "<cmd>q<cr>", "Quit" },
    ["e"] = { "<cmd>Neotree toggle<cr>", "Toggle Explorer" },
    ["n"] = { "<cmd>nohl<cr>", "No highlight" },
    ["b"] = {
      name = "Buffers",
      ["p"] = { "<cmd>BufferLinePick<cr>", "Pick" },
      ["f"] = { "<cmd>BufferLineTogglePin<cr>", "Toggle pin" },
      ["c"] = { "<cmd>BufferLinePickClose<cr>", "Pick close" },
      ["d"] = { "<cmd>Bdelete<cr>", "Close Current" },
      ["m"] = { "<cmd>BufferLineCloseRight<cr><cmd>BufferLineCloseLeft<cr>", "Close all other" },
      ["l"] = { "<cmd>BufferLineCloseRight<cr>", "Close right" },
      ["h"] = { "<cmd>BufferLineCloseLeft<cr>", "Close left" },
      ["s"] = {
        name = "Sort",
        ["t"] = { "<cmd>BufferLineSortByTabs<cr>", "By tabs" },
        ["d"] = { "<cmd>BufferLineSortByDirectory<cr>", "By directory" },
        ["e"] = { "<cmd>BufferLineSortByExtension<cr>", "By extension" },
        ["r"] = { "<cmd>BufferLineSortByRelativeDirectory<cr>", "By relative directory" },
      }
    },
    ["p"] = {
      name = "Packer",
      ["s"] = { "<cmd>PackerSync<CR>", "Sync" },
      ["i"] = { "<cmd>PackerInstall<CR>", "Install" },
      ["u"] = { "<cmd>PackerUpdate<CR>", "Update" },
      ["c"] = { "<cmd>PackerCompile<CR>", "Compile" },
    },
  }

  whichKey.setup(setup)
  whichKey.register(mappings, opts)
end)
