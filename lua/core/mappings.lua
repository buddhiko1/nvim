local opt = require("utils").opt
local map = require("utils").map


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
map("n", "F", "g_", opt("Jump to eol"))
map("v", "F", "g_", opt("Jump to eol"))

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


-- packer
map("n", "<leader>sy", "<cmd> :PackerSync <CR>", opt(""))


-- theme switch
map("n", "<leader>t", "colors_name == 'dawnfox' ? '<cmd> :colorscheme duskfox <CR>' : '<cmd> :colorscheme dawnfox <CR>'", { expr =true })