local map = require("utils").map

-- window
-- Pressing the same keybind again will let you jump into the hover window.
-- If that doesn’t work then try <C-w><C-w> to let vim try to jump into the floating window.
map("n", "wh", "<C-w>h")
map("n", "wl", "<C-w>l")
map("n", "wk", "<C-w>k")
map("n", "wj", "<C-w>j")
map("n", "wc", "<C-w>c")
map("n", "wo", "<C-w>o")
map("n", "wv", "<cmd> :vsp<CR>")
map("n", "wb", "<cmd> :sp<CR>")

-- motion
map("n", "J", "7j")
map("n", "K", "7k")
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

-- edit
map("n", "<leader>ee", "`.") -- latest edited word
map("n", "<leader>en", "*") -- search forward for the next instance of the identifier under the cursor
map("n", "<leader>ep", "#") -- search backward for the next instance of the identifier under the cursor
map("n", "<leader>eu", "gUaw") -- uppercase
map("n", "<leader>eU", "gUaW")
map("n", "<leader>el", "guaw") -- lowercase
map("n", "<leader>eL", "guaW")
map("n", "<leader>ec", function()
  vim.cmd("1,$d")
end) -- delete file content


-- remapping
map("n", "<leader><Esc>", "<cmd> :wqa!<CR>")
map("n", "<leader>x", ":noh <CR>") -- shut down the search high light
map("n", "<leader><Space>", [[i<End><CR><ESC>]])

map("n", "<leader>j", "J") -- join
map("n", "<leader>h", "@")
map("n", "<leader>r", "q")

-- packer
map("n", "<leader>u", "<cmd> :PackerSync <CR>")
