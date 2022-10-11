local map = require("utils").map

-- map("n", "s", "")
-- window
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
map({ "n", "v" }, "B", "^")
map({ "n", "v" }, "E", "g_")
map({ "n", "v" }, "<Space>", "w")

map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- map("i", "<C-j>", "<ESC>jli")
-- map("i", "<C-k>", "<ESC>kli")
map("i", "<C-b>", "<ESC>bi")
map("i", "<C-e>", "<End>")
map("i", "<C-h>", "<ESC>i")
map("i", "<C-l>", "<ESC>2li")

-- move line in line visual model when shift is active.
map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- copy and past
map("i", "<C-p>", [[<ESC>"+pa]])
map("n", "yy", [["+yy]])
map({ "n", "v" }, "y", [["+y]])
map({ "n", "v" }, "d", [["+d]])
map("n", "dd", [["+dd]])
map("n", "p", [["+p]])

-- "u" undo,"." redo
-- map({ "n" }, "<leader>z", "<cmd> :u<CR>")

-- other assistant
map("n", "pp", [[i<End><CR><ESC>pi<End><CR><ESC>]])
map("n", "<leader><Space>", [[i<End><CR><ESC>]])
map("n", "<leader>q", "<cmd> :wqa!<CR>")
map({ "n", "v", "i" }, "<leader><leader>", "<ESC>")
map({ "n", "v" }, "<leader>x", "<cmd> :q<CR>")

-- remapping
map("n", "<Esc>", "<cmd> :noh <CR>") -- shut down the search high light
map("n", "<leader>r", "q") -- recording
map("n", "<leader>j", "J") -- join
map("n", "<A-v>", "<C-v>")

-- packer
map("n", "<leader>u", "<cmd> :PackerSync <CR>")
