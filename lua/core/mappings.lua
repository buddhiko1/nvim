local map = require("utils").map

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
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")

-- move line in line visual model when shift is active.
map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- copy and past
map({ "n", "v" }, "y", [["+y]])
map("n", "yy", [["+yy]])
map({ "n", "v" }, "d", [["+d]])
map("n", "dd", [["+dd]])
map("n", "p", [["+p]])
map("i", "<C-p>", [[<ESC>"+pa]])

-- edite
map("n", "<leader>ee", "`.") -- latest edited word
map("n", "<leader>en", "*") -- search forward for the next instance of the identifier under the cursor
map("n", "<leader>ep", "#") -- search backward for the next instance of the identifier under the cursor
map("n", "<leader>eu", "gUw") -- uppercase
map("n", "<leader>eU", "gUW")
map("n", "<leader>el", "guw") -- lowercase
map("n", "<leader>eL", "guW")

-- remapping
map("n", "<leader><Esc>", "<cmd> :wqa!<CR>")
map({ "n", "v", "i" }, "<leader><leader>", "<ESC>")
map("n", "<leader>x", ":noh <CR>") -- shut down the search high light
map("n", "<leader><Space>", [[i<End><CR><ESC>]])

map("n", "<leader>j", "J") -- join
map("n", "<leader>q", "@")
map("n", "<leader>r", "q")

-- packer
map("n", "<leader>pu", "<cmd> :PackerSync <CR>")
