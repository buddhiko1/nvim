local present, packer = pcall(require, "packer")

if not present then
  local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  vim.fn.delete(packer_path, "rf")

  print "Cloning packer.."

  vim.fn.system {
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    "--depth",
    "20",
    packer_path,
  }

  vim.cmd("packadd packer.nvim")

  present, packer = pcall(require, "packer")

  if present then
    print "Packer cloned successfully."
  else
    error("Couldn't clone packer !")
  end
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 6000, -- seconds
  },
  auto_clean = true,
  compile_on_sync = true,
  snapshot = nil,
}

local plugins = require("plugins")

return packer.startup(function(use)
  for _, plugin in pairs(plugins) do
    use(plugin)
  end
end)
