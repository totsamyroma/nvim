local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local builtin = require('telescope.builtin')
local fb = telescope.extensions.file_browser

local ts_select_dir_for_grep = function()
  fb.file_browser({
    files = false,
    depth = false,
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        local pattern = vim.fn.input("Pattertn: ", "*")

        builtin.live_grep({
          results_title = relative .. "/" .. pattern,
          cwd = absolute,
          glob_pattern = pattern,
        })
      end)

      return true
    end,
  })
end

local ts_select_dir_for_find_files = function()
  fb.file_browser({
    files = false,
    depth = false,
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local entry_path = action_state.get_selected_entry().Path
        local dir = entry_path:is_dir() and entry_path or entry_path:parent()
        local relative = dir:make_relative(vim.fn.getcwd())
        local absolute = dir:absolute()

        builtin.find_files({
          results_title = relative .. "/",
          cwd = absolute,
        })
      end)

      return true
    end,
  })
end

vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<C-f>', ts_select_dir_for_find_files, { desc = "Find files in directory" })
vim.keymap.set('i', '<C-f>', ts_select_dir_for_find_files, { desc = "Find files in directory" })
vim.keymap.set('n', '<C-g>', ts_select_dir_for_grep, { desc = "Grep in directory" })
vim.keymap.set('i', '<C-g>', ts_select_dir_for_grep, { desc = "Grep in directory" })
