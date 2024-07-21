set tabstop=4 " tab size
set shiftwidth=4
set number " line number
"set completeopt-=preview,longest,menuone " completion popup
set nowrap " no text wrap
set ai " auto indenting
set backspace=indent,eol,start " make that backspace key work the way it should
set laststatus=2 " make the last line where the status is two lines deep so you can see status always
set ruler " show cursor pos
set showmatch " show matching braces
set showmode " show the current mode
set nocompatible " be iMproved, required
set hlsearch " highlights matches in search
set path+=usr/include/c++/14 " add c++ includes to path
set nofoldenable " disable folding
set nobackup " Prevent possible problems with coc language servers
set nowritebackup " ^
set signcolumn=yes

call plug#begin()

Plug 'rstacruz/sparkup', {'rtp': 'vim/'} " HTML parser
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'nvim-tree/nvim-tree.lua' " File system explorer
Plug 'nvim-lua/plenary.nvim' " Required by todo-comments
Plug 'folke/todo-comments.nvim' " Todo comment highlighting, view todos, etc.
Plug 'nvim-lualine/lualine.nvim' " Statusline (bottom bar)
Plug 'nvim-tree/nvim-web-devicons' " Icons for statusline
Plug 'shellRaining/hlchunk.nvim' " Braces/chunk highligher. Indent lines.
Plug 'MattesGroeger/vim-bookmarks' " Bookmark manager
Plug 'stevearc/aerial.nvim' " Symbols outline
Plug 'sakhnik/nvim-gdb' " GDB Debugger
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Treesitter
Plug 'eandrju/cellular-automaton.nvim' " make_it_rain or game_of_life (Useless (For funzies))
Plug 'themercorp/themer.lua' " Theme manager
Plug 'neoclide/coc.nvim', {'branch': 'master'}
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'

call plug#end()

let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1

let g:coc_node_path = '/usr/bin/node'
let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-git', 'coc-json', 'coc-sh']

"let g:clang_library_path='/usr/lib/llvm-13/lib/libclang-13.so.1'

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-b> :AerialToggle<CR>

nnoremap <F2> :noh<CR>

"inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
"inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
inoremap <silent><expr> <c-@> coc#refresh()
nmap <leader>rn <Plug>(coc-rename)

map <silent> , :lua require('nvim-window').pick()<CR>

command Wq wq

lua << EOF

local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
	group = lastplace,
	pattern = { "*" },
	desc = "remember last cursor place",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

require'hlchunk'.setup{
	indent = {
		enable = false,
		chars = {
			"│",
			"¦",
			"┆",
			"┊"
		},
		style = {
			{ fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") }
		}
	},
	chunk = {
		{ fg = "#806d9c" }, -- I hate hardcoding these, but I can't get anything else to work
		{ fg = "#806d9c" }
	},
	blank = { enable = false }
}

require'lualine'.setup{
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '◣', right = '◢'},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'filename', 'branch', 'diff'},
		lualine_c = {'diagnostics'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {'fugitive', 'nerdtree', 'symbols-outline'}
}

require"themer".setup{
	colorscheme = "monokai_pro",
	styles = {
	--["function"] = { style = 'italic' },
		--functionbuiltin = { style = 'italic' },
		--variable = { style = 'italic' },
		--variableBuiltIn = { style = 'italic' },
		--parameter  = { style = 'italic' },
		comment = { style = 'italic' },
		todo = { style = 'bold' }
	}
}

require'aerial'.setup{}

require'nvim-tree'.setup{
	git = {
		enable = true,
		ignore = false,
		timeout = 500
	}
}

require'nvim-treesitter.configs'.setup{
	ensure_installed = { "asm", "c", "cmake", "cpp", "diff", "disassembly", "git_config", "gitcommit", "gitignore", "lua", "make", "vim" },
	auto_install = true,

	indent = {
		enable = true
	},
	highlight = {
	enable = true
	}
}

EOF
