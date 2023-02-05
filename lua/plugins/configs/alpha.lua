local load = require("utils").load

local M = {}

M.setup = function() end

local logo = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("LD", "<leader>")

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
      val = 5,
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
      val = 5,
    },
    {
      type = "group",
      val = {
        button("LD fr", "  Recent File  "),
        button("LD fp", "  Projects  "),
        button("LD  [", "  Browser File "),
        button("LD fs", "  Live Grep  "),
        button("LD  <Esc>", "  Quit neovim "),
      },
      opts = {
        spacing = 1,
      },
    },
  },
  opts = {},
}

M.config = function()
  local alpha = load("alpha")
  alpha.setup(options)
end

return M
