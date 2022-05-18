local map = require("utils").map

-- window
map("n", "s", "")
map("n", "wh", "<C-w>h")
map("n", "wl", "<C-w>l")
map("n", "wk", "<C-w>k")
map("n", "wj", "<C-w>j")
map("n", "wcc", "<C-w>c")
map("n", "woo", "<C-w>o")
map("n", "wvv", "<cmd> :vsp<CR>")
map("n", "wbb", "<cmd> :sp<CR>")

-- tab
map("n", "<C-h>", ":tabprevious<CR>")
map("n", "<C-l>", ":tabnext<CR>")
map("n", "<C-d>", ":tabclose<CR>")

-- motion
map("n", "J", "5j")
map("n", "K", "5k")
map("n", "B", "^")
map("n", "E", "g_")


map("v", "B", "^")
map("v", "E", "g_")
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")
map("v", "<", "<gv")
map("v", ">", ">gv")

map("i", "<C-j>", "<ESC>1ji")
map("i", "<C-k>", "<ESC>1ki")
map("i", "<C-b>", "<Home>")
map("i", "<C-e>", "<End>")
map("i", "<C-h>", "<ESC>hi")
map("i", "<C-l>", "<ESC>li")


-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- copy and past
map("v", "<C-y>", [["+y]])
map("n", "<C-v>", [["+p]])
map("i", "<C-v>", [[<ESC>"+pa]])

-- assistant
map("n", "pp", [[i<End><CR><ESC>pi<End><CR><ESC>]])
map("n", "<leader><leader>", [[i<End><CR><ESC>]])

-- statusbar toggle
map("n", "<leader>y", "<cmd> :set laststatus=0 <CR>")
map("n", "<leader>yy", "<cmd> :set laststatus=3 <CR>")

-- packer
map("n", "<leader>uu", "<cmd> :PackerSync <CR>")

-- remapping
map("n", "<Esc>", "<cmd> :noh <CR>") -- shut down the search high light
map("n", "<leader>q", "q") -- recording
map("n", "<leader>j", "J") -- join
map("n", "<A-v>", "<C-v>")
