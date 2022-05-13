local load = require("utils").load
local map = require("utils").map
local opt = require("utils").opt

local M = {}

M.setup = function ()
    map("n", "<leader>ss", "<cmd> :SessionManager save_current_session<CR>", opt(""))
    map("n", "<leader>sl", "<cmd> :SessionManager load_session<CR>", opt(""))
    map("n", "<leader>sr", "<cmd> :SessionManager load_last_session", opt(""))
    map("n", "<leader>sd", "<cmd> :SessionManager delete_session<CR>", opt(""))
end

M.config = function ()
    local Path = require('plenary.path')
    local session_manager = load("session_manager")

    local options = {
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
        path_replacer = '__',
        colon_replacer = '++',
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_filetypes = {
            'gitcommit',
        },
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 70,
    }

  session_manager.setup(options)
end

return M