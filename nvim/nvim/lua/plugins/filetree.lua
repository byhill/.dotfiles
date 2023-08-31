-- Neotree: https://github.com/nvim-neo-tree/neo-tree.nvim

-- For all defaults for neo-tree, see
-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua

local setup = function()
  vim.keymap.set('n', '<leader>f', ':Neotree toggle<cr>', { silent = true })
  vim.keymap.set('n', '<leader>.', ':Neotree position=current toggle<cr>', { silent = true })

  -- If you want icons for diagnostic errors, you'll need to define them somewhere:
  vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" })

  require("neo-tree").setup({
    use_default_mappings = false,
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,

    sources = {
      "filesystem",
      -- "buffers",
      "git_status",
      -- "document_symbols",
    },

    window = {
      position = "right",
      width = 40,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<esc>"] = "close_window",
        ["h"] = function(state)
          local node = state.tree:get_node()
          local is_root = node:get_id() == state.tree:get_nodes()[1]:get_id()
          if is_root and not node:is_expanded() and state.commands.navigate_up then
            state.commands.navigate_up(state)
          elseif (node.type == "directory" or node:has_children()) and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            state.commands.close_node(state)
          end
        end,
        ["l"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" or node:has_children() then
            if not node:is_expanded() then
              state.commands.toggle_node(state)
            else
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          else
            require("neo-tree.sources.filesystem.commands").open(state)
          end
        end,
        ["P"] = { "toggle_preview", config = { use_float = false } },
        -- ["w"] = "open_with_window_picker",
        ["S"] = "open_split",  -- ["S"] = "split_with_window_picker",
        ["s"] = "open_vsplit", -- ["s"] = "vsplit_with_window_picker",
        ["t"] = "open_tabnew", -- ["t"] = "open_tab_drop", -- :help drop
        ['C'] = 'close_all_subnodes',
        ["z"] = "close_all_nodes",
        ["Z"] = "expand_all_nodes",
        ["a"] = { "add", config = { show_path = "relative" } }, -- "none", "relative", "absolute"
        ["A"] = "add_directory",                                -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
        ["m"] = "move",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["i"] = "show_file_details",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["?"] = "show_help",
      }
    },

    filesystem = {
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          "lazy-lock.json",
        },
        hide_by_pattern = {},
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignore",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".DS_Store",
        },
        never_show_by_pattern = {},
      },
      hijack_netrw_behavior = "open_default",
      window = {
        mappings = {
          ["."] = "set_root",
          ["o"] = "set_root",
          ["!"] = "toggle_hidden",
          ["/"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        },
        fuzzy_finder_mappings = {
          ["<down>"] = "move_cursor_down",
          ["<C-n>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-p>"] = "move_cursor_up",
        },
      }
    },

    git_status = {
      window = {
        mappings = {
          ["A"]  = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        }
      }
    },

    event_handlers = {
      { -- Close neo-tree after a file is opened
        event = "file_opened",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    },
  })
end


return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function() setup() end,
}
