local opt = require("utils").opt
local map = require("utils").map


-- window
map("n", "s", "", opt(""))
map("n", "wh", "<C-w>h", opt(""))
map("n", "wl", "<C-w>l", opt(""))
map("n", "wk", "<C-w>k", opt(""))
map("n", "wj", "<C-w>j", opt(""))
map("n", "wc", "<C-w>c", opt(""))
map("n", "oo", "<C-w>o", opt("")) -- close other
map("n", "vv", "<cmd> :vsp<CR>", opt(""))
map("n", "bb", "<cmd> :sp<CR>", opt(""))


-- tab 
map("n", "<C-h>", ":tabprevious<CR>", opt("Goto previous tab"))
map("n", "<C-l>", ":tabnext<CR>", opt("Goto next tab"))
map("n", "<C-t>", ":tabnew<CR>", opt("Create a new tab"))


-- motion
map("n", "J", "5j", opt("Jump 5 lines down"))
map("n", "K", "5k", opt("Jump 5 lines up"))
map("n", "B", "^", opt("Jump to bol"))
map("n", "E", "g_", opt("Jump to eol"))


map("v", "E", "g_", opt("Jump to eol"))
map("v", "B", "^", opt("Jump to bol"))
map("v", "J", ":move '>+1<CR>gv-gv", opt(""))
map("v", "K", ":move '<-2<CR>gv-gv", opt(""))
map("v", "<", "<gv", opt(""))
map("v", ">", ">gv", opt(""))

map("i", "<C-j>", "<ESC>1ji", opt(""))
map("i", "<C-k>", "<ESC>1ki", opt(""))
map("i", "<C-h>", "<Home>", opt("Jump to bol"))
map("i", "<C-l>", "<End>", opt("Jump to eol"))
map("i", "<C-w>", "<ESC>wi", opt(""))
map("i", "<C-b>", "<ESC>bi", opt(""))


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


-- statusbar toggle
map("n", "<leader>y", "<cmd> :set laststatus=0 <CR>", opt(""))
map("n", "<leader>yy", "<cmd> :set laststatus=3 <CR>", opt(""))


-- packer
map("n", "<leader>uu", "<cmd> :PackerSync <CR>", opt(""))
