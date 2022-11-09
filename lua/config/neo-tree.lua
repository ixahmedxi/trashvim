vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

import("neo-tree", function (neoTree)
  neoTree.setup({
    close_if_last_window = true,
    hide_root_node = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      mappings = {
        ["l"] = "open",
        ["o"] = "open",
      }
    },
    filesystem = {
      filtered_items = {
        always_show = {
          ".gitignore"
        },
        never_show = {
          ".git",
          ".DS_Store",
        }
      },
      follow_current_file = true,
      use_libuv_file_watcher = true,
    },
    source_selector = {
      winbar = true
    }
  })
end)
