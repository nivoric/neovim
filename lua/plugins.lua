require("lazy").setup({
  -- 1. THE COLORSCHEME (Tokyo Night)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "night", transparent = true },
  },

  -- 2. THE UI (Render Markdown)
  -- This version is configured to work without Treesitter.
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- We disable features that strictly require Treesitter parsing
      anti_conceal = { enabled = false },
      win_config = { concealcursor = 'n' },
      -- Standard Markdown features work fine with regex
      heading = { enabled = true },
      bullet = { enabled = true },
      checkbox = { enabled = true },
    },
  },

  -- 3. THE UTILITIES (Markdown shortcuts)
  -- Adds logic for bolding, italics, and jumping between headers.
  {
    'tadmccorkle/markdown.nvim',
    ft = "markdown",
    opts = {
      mappings = {
        inline_surround_toggle = '<leader>ms', -- Surround text with * or _
        quote_toggle = '<leader>mq',           -- Toggle blockquotes
      }
    },
  },
-- 4. TELESCOPE aka The search engine of buffers.
{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', -- Use a stable release
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        -- This ensures it uses Lua-searching instead of requiring a C-compiler
        file_ignore_patterns = { "node_modules", ".git/" },
        path_display = { "truncate" },
      },
    },
  },

  -- PLENARY (Required by Telescope and Obsidian)
  { "nvim-lua/plenary.nvim", lazy = true },

  -- 5. ICONS (Necessary for the checkboxes and headers)
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- 6. HARPOON (the multiple files workflow)
  {
	  'ThePrimeagen/harpoon',
	  branch = "harpoon2",
	  dependencies = { 'nvim-lua/plenary.nvim' },
	  config = function()
		  require("harpoon"):setup()
		end,
	},

-- TOGGLETERM: The "Mini Terminal"
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = [[<leader>th]], -- Your requested shortcut
      direction = 'float',           -- Makes it a "Mini" floating window
      float_opts = {
        border = 'curved',           -- Gives it a nice rounded look
        width = 80,
        height = 20,
      },
      shade_terminals = true,
    },
  },

--- 7. MEMORY AIDE (looking up shortcuts)
{
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300 -- Menu appears after 300ms of pressing space 
	end,
	opts = {
		-- Leave empty for default look, or customize icons here
		icons = { group = "󰉋" },
	},
},
})
