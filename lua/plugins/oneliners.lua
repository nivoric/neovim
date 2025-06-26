return {
    { -- This helps with ssh tunneling and copying to clipboard
	'ojroques/vim-oscyank',
    },
    { -- Git plugin
	'tpope/vim-fugitive'
    },
    { -- show css colors
	'brenoprata10/nvim-highlight-colors',
	config = function()
	    require('nvim-highlight-colors').setup({})
	end
    },
}
