local load = require("utils").load
local map = require("utils").map


local M = {}

M.setup = function()
  map("n", "<leader>m", function()
    vim.cmd "Alpha"
  end)
end

local logo = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local options = {
  layout = {
    {
      type = "padding",
      val = 7
    },
    {
      type = "text",
      val = logo,
      opts = {
        position = "center",
        hl = "AlphaHeader",
      },
    },
    {
      type = "padding",
      val = 5
    },
    {
      type = "group",
      val = {
        button("SPC f p", "  Projects  "),
        button("SPC f o", "  Recent File  "),
        button("SPC f f", "  Find File  "),
        button("SPC f w", "  Find Word  "),
        button("SPC f n", "  New File  "),
        button("SPC e e", "  Exit  "),
      },
      opts = {
        spacing = 1,
      },
    }
  },
  opts = {},
}

M.config = function()
  local alpha = load("alpha")
  alpha.setup(options)
  vim.cmd("autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2")
end

return M
