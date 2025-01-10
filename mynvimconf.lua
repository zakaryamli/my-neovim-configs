vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
--lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
--plugins
vim.opt.rtp:prepend(lazypath)
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
   {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}

}
local opts = {}
require("lazy").setup(plugins, opts)
--telescope config
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--live grep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--catppucin theme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
--tree_setter config "highlights"
local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "c", "lua", "cpp","vim", "vimdoc", "javascript", "html" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})
--require("vim-options")

