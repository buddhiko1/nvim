local map = require("utils").map

-- window
map("n", "s", "")
map("n", "wh", "<C-w>h")
map("n", "wl", "<C-w>l")
map("n", "wk", "<C-w>k")
map("n", "wj", "<C-w>j")
map("n", "wc", "<C-w>c")
map("n", "wo", "<C-w>o")
map("n", "wv", "<cmd> :vsp<CR>")
map("n", "wb", "<cmd> :sp<CR>")

-- motion
map("n", "J", "5j")
map("n", "K", "5k")
map("n", "B", "^")
map("n", "E", "g_")
map("n", "<Space>", "w")

map("v", "B", "^")
map("v", "E", "g_")
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

map("i", "<C-j>", "<ESC>jli")
map("i", "<C-k>", "<ESC>kli")
map("i", "<C-b>", "<ESC>bi")
map("i", "<C-e>", "<End>")
map("i", "<C-h>", "<ESC>i")
map("i", "<C-l>", "<ESC>2li")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- copy and past
map("i", "<C-p>", [[<ESC>"+pa]])
map("n", "yy", [["+yy]])
map({ "n", "v" }, "y", [["+y]])
map({ "n", "v"}, "d", [["+d]])
map("n", "dd", [["+dd]])
map("n", "p", [["+p]])

-- assistant
map("n", "pp", [[i<End><CR><ESC>pi<End><CR><ESC>]])
map("n", "<leader><Space>", [[i<End><CR><ESC>]])
map("n", "<leader>e", "<cmd> :wqa!<CR>")
map({ "n", "v", "i" }, "<leader>h", ":vertical help ")

map("n", "<leader>e", "<cmd> :wqa!<CR>")
-- packer
map("n", "<leader>uu", "<cmd> :PackerSync <CR>")

-- remapping
map("n", "<Esc>", "<cmd> :noh <CR>") -- shut down the search high light
map("n", "<leader>r", "q") -- recording
map("n", "<leader>j", "J") -- join
map("n", "<A-v>", "<C-v>")
