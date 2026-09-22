vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = ""

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes:1"
vim.opt.showmatch = true -- highlights matching brackets

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true -- do create an undo file
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
--vim.opt.ttimeoutlen = 50 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.errorbells = false -- no error sounds
--vim.opt.clipboard:append("unnamedplus") -- use system clipboard

vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.laststatus = 3
vim.opt.showmode = false -- do not show the mode, instead have it in statusline
vim.opt.cmdheight = 0

vim.opt.autocomplete = true

vim.pack.add { 
	"https://github.com/stevearc/oil.nvim", 

  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/mikavilpas/yazi.nvim",

  "https://github.com/catppuccin/nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-orgmode/orgmode",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/ibhagwan/fzf-lua",
}

vim.cmd.colorscheme("catppuccin")

require('lualine').setup({
  options = {
    globalstatus = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
})

vim.lsp.config("gopls", {})

vim.lsp.enable("gopls")

-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
-- vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

require("orgmode").setup({
  org_agenda_files = "~/org/**/*",
  org_default_notes_file = "~/org/refile.org",

  org_todo_keywords = { "TODO", "NEXT", "WAITING", "|", "DONE", "CANCELLED" },

  org_capture_templates = {
    t = {
      description = "Task",
      template = "* TODO %?\n  Created: %U",
      target = "~/org/refile.org",
    },
    n = {
      description = "Note",
      template = "* %?\n  Created: %U",
      target = "~/org/notes.org",
      headline = "Notes",
    },
  },
})

local orgmode = require("orgmode")

-- Global Orgmode keybindings
vim.keymap.set("n", "<leader>oa", function()
  orgmode.action("agenda.prompt")
end, { desc = "Org Agenda" })

vim.keymap.set("n", "<leader>oc", function()
  orgmode.action("capture.prompt")
end, { desc = "Org Capture" })

require("fzf-lua").setup()

local fzf = require("fzf-lua")

-- File & Buffer Search
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent Files" })

require("oil").setup()

-- Open Oil in the directory of the current file
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Alternatively: Float window mode
vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil float" })

require("yazi").setup()

-- Open at current file
vim.keymap.set("n", "<leader>y", "<cmd>Yazi<cr>", { desc = "Open Yazi" })

-- Open at working directory
vim.keymap.set("n", "<leader>cw", "<cmd>Yazi cwd<cr>", { desc = "Open Yazi in CWD" })

