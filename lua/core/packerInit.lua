local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    print("installing packer ...")
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    print("packer installed successfully!")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require("packer")

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
    prompt_border = "single",
  },
})

return packer.startup(function(use)
  local plugins = require("plugins")
  for _, plugin in pairs(plugins) do
    use(plugin)
  end

  if packer_bootstrap then
    packer.sync()
  end
end)
