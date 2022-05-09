local user_cmd = vim.api.nvim_create_user_command

local packer_cmd = require("core.utils").packer_cmd
local opt = require("core.utils").opt
local map = require("core.utils").map


-- window
map("n", "s", "", opt(""))
map("n", "sh", "<C-w>h", opt(""))
map("n", "sl", "<C-w>l", opt(""))
map("n", "sk", "<C-w>k", opt(""))
map("n", "sj", "<C-w>j", opt(""))
map("n", "sc", "<C-w>c", opt(""))
map("n", "so", "<C-w>o", opt("")) -- close other
map("n", "sv", "<cmd> :vsp<CR>", opt(""))
map("n", "sb", "<cmd> :sp<CR>", opt(""))


-- motion
map("n", "J", "5j", opt("Jump 5 lines down"))
map("v", "J", "5j", opt("Jump 5 lines down"))
map("n", "K", "5k", opt("Jump 5 lines up"))
map("v", "K", "5k", opt("Jump 5 lines up"))
map("n", "A", "^", opt("Jump to bol"))
map("v", "A", "^", opt("Jump to bol"))
map("n", "E", "g_", opt("Jump to eol"))
map("v", "E", "g_", opt("Jump to eol"))

map("i", "<C-j>", "<ESC>1ji", opt(""))
map("i", "<C-k>", "<ESC>1ki", opt(""))
map("i", "<C-h>", "<Home>", opt("Jump to bol"))
map("i", "<C-l>", "<End>", opt("Jump to eol"))
map("i", "<C-w>", "<ESC>wi", opt(""))
map("i", "<C-b>", "<ESC>bi", opt(""))

map("n", "W", "5w", opt("Jump 5 word forward"))
map("n", "B", "5b", opt("Jump 5 word backward"))

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http<cmd> ://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })


-- behavior
map("n", "<Esc>", "<cmd> :noh <CR>", opt("Close search highlight")) -- shut down the search high light

-- undo redo
-- map("n", "<C-z>", "u", opt("Undo"))
-- map("n", "<C-Z>", "<C-r>", opt("Redo"))
-- map("i", "<C-z>", "<ESC>u", opt("Undo"))
-- map("i", "<C-Z>", "<ESC><C-r>", opt("Redo"))

map("n", "q", ":q<CR>", opt(""))
map("n", "qq", ":q!<CR>", opt(""))
map("n", "Q", ":qa!<CR>", opt(""))

map("v", "<C-y>", [["+y]], opt("Copy to system clipboard"))
map("n", "<C-p>", [["+p]], opt("Paste from system clipboard"))
map("i", "<C-p>", [[<ESC>"+pa]], opt("Paste from system clipboard"))

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("v", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true })


-- packer
map("n", "<leader>sy", "<cmd> :PackerSync <CR>", opt(""))

user_cmd("PackerSnapshot", function(info)
   require "plugins"
   require("packer").snapshot(info.args)
end, { nargs = "+" })

user_cmd("PackerSnapshotDelete", function(info)
   require "plugins"
   require("packer.snapshot").delete(info.args)
end, { nargs = "+" })

user_cmd("PackerSnapshotRollback", function(info)
   require "plugins"
   require("packer").rollback(info.args)
end, { nargs = "+" })

user_cmd("PackerClean", packer_cmd "clean", {})
user_cmd("PackerCompile", packer_cmd "compile", {})
user_cmd("PackerInstall", packer_cmd "install", {})
user_cmd("PackerStatus", packer_cmd "status", {})
user_cmd("PackerSync", packer_cmd "sync", {})
user_cmd("PackerUpdate", packer_cmd "update", {})