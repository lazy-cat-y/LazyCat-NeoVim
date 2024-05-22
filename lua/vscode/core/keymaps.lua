local opts = { noremap = true, silent = true }

local bind = vim.keymap.set

local vscode = require("vscode-neovim")

bind("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function vscode_action(cmd)
    return function()
        vscode.action(cmd)
    end
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- cmd
-- <C-n> next suggestion
-- <C-p> previous suggestion

-- save and quit
bind('n', "<leader>w", vscode_action("workbench.action.files.save"), opts)
bind('n', "<leader>q", vscode_action("workbench.action.closeActiveEditor"), opts)

-- search
bind('n', '<leader>ff', vscode_action("workbench.action.quickOpen"), opts)
bind('n', '<leader>fw', vscode_action("workbench.action.findInFiles"), opts)

-- Navigate
bind('n', '<C-j>', vscode_action("workbench.action.navigateDown"), opts)
bind('x', '<C-j>', vscode_action("workbench.action.navigateDown"), opts)
bind('n', '<C-k>', vscode_action("workbench.action.navigateUp"), opts)
bind('x', '<C-k>', vscode_action("workbench.action.navigateUp"), opts)
bind('n', '<C-h>', vscode_action("workbench.action.navigateLeft"), opts)
bind('x', '<C-h>', vscode_action("workbench.action.navigateLeft"), opts)
bind('n', '<C-l>', vscode_action("workbench.action.navigateRight"), opts)
bind('x', '<C-l>', vscode_action("workbench.action.navigateRight"), opts)

bind('n', '<leader>sv', vscode_action("workbench.action.splitEditorRight"), opts)
bind('x', '<leader>sv', vscode_action("workbench.action.splitEditorRight"), opts)
bind('n', '<leader>sh', vscode_action("workbench.action.splitEditorDown"), opts)
bind('x', '<leader>sh', vscode_action("workbench.action.splitEditorDown"), opts)

bind('n', '<leader>mh', vscode_action("workbench.action.moveEditorToPreviousGroup"), opts)
bind('x', '<leader>mh', vscode_action("workbench.action.moveEditorToPreviousGroup"), opts)
bind('n', '<leader>ml', vscode_action("workbench.action.moveEditorToNextGroup"), opts)
bind('x', '<leader>ml', vscode_action("workbench.action.moveEditorToNextGroup"), opts)
bind('n', '<leader>mj', vscode_action("workbench.action.moveEditorToPreviousGroup"), opts)
bind('x', '<leader>mj', vscode_action("workbench.action.moveEditorToPreviousGroup"), opts)
bind('n', '<leader>mk', vscode_action("workbench.action.moveEditorToPreviousGroup"), opts)
bind('x', '<leader>mk', vscode_action("workbench.action.moveEditorToPreviousGroup"), opts)

bind('n', '<leader>.', vscode_action("workbench.action.increaseViewSize"), opts)
bind('x', '<leader>.', vscode_action("workbench.action.increaseViewSize"), opts)
bind('n', '<leader>,', vscode_action("workbench.action.decreaseViewSize"), opts)
bind('x', '<leader>,', vscode_action("workbench.action.decreaseViewSize"), opts)
bind('n', '<leader>=', vscode_action("workbench.action.increaseViewHeight"), opts)
bind('x', '<leader>=', vscode_action("workbench.action.increaseViewHeight"), opts)
bind('n', '<leader>-', vscode_action("workbench.action.decreaseViewHeight"), opts)
bind('x', '<leader>-', vscode_action("workbench.action.decreaseViewHeight"), opts)

-- Toggles
bind('n', '<leader>e', vscode_action("workbench.action.toggleSidebarVisibility"), opts)

-- buffers
bind('n', '<leader>bp', vscode_action("workbench.action.previousEditorInGroup"), opts)
bind('n', '<leader>bn', vscode_action("workbench.action.nextEditorInGroup"), opts)
