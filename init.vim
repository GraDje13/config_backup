call plug#begin()

" LSP
Plug 'neovim/nvim-lspconfig'
"Plug 'glepnir/lspsaga.nvim'

" Rust Analyzer
Plug 'simrat39/rust-tools.nvim'

" Code completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Color Theme
"Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'

" File finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Lua Line with icons
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Start screen
Plug 'mhinz/vim-startify'

" Tabs
Plug 'kdheepak/tabline.nvim'

" Git
Plug 'TimUntersberger/neogit'

"Latex
Plug 'lervag/vimtex'
call plug#end()

" Theme
if (has("termguicolors"))
 set termguicolors
endif
" Enable bold/italic fonts
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
" Fix transparency
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" File finder keybinds
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Tab navigation
nnoremap <leader>] <cmd>TablineBufferNext<cr>
nnoremap <leader>[ <cmd>TablineBufferPrevious<cr>
nnoremap <leader>o <cmd>TablineTabNew<cr>

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

" File tree keybindings
"nnoremap <C-n> :NvimTreeToggle<CR>
"nnoremap <leader>r :NvimTreeRefresh<CR>
"nnoremap <leader>n :NvimTreeFindFile<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Line numbering
set number relativenumber

" fix tabs
set tabstop=4

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Autoformatting
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 500)

let s:startify_ascii_header = [
 \ '                                                                           -`',
 \ '                                                                          .o+`',
 \ '                                                                         `ooo/',
 \ '                                                                        `+oooo:',
 \ '                                                                       `+oooooo:',
 \ '                                                                       -+oooooo+:',
 \ '                                        ▟▙                           `/:-:++oooo+:',
 \ '                                        ▝▘                          `/++++/+++++++:',
 \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖             `/++++++++++++++:',
 \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██            `/+++ooooooooooooo/`',
 \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██           ./ooosssso++osssssso+`',
 \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██          .oossssso-````/ossssss+`',
 \ '▀▀    ▀▀   ▝▀▀▀▀      ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀         -osssssso.      :ssssssso.',
 \ '                                                              :osssssss/        osssso+++.',
 \ '                                                             /ossssssss/        +ssssooo/-',
 \ '                                                           `/ossssso+/:-        -:/+osssso+-',
 \ '                                                          `+sso+:-`                 `.-/+oso:',
 \ '                                                         `++:.                           `-/+/',
 \ '                                                         .`                                 `/',
 \ '',
 \]

let g:startify_custom_header_quotes = [
			\ ['Open heart, open mind, open source'],
			\ ['Physics is law, everything else is a recommendation'],
			\ ['I use arch btw'],
			\ ['Philosophy is written in this grand book — I mean the universe — which stands continually open to our', 'gaze, but it cannot be understood unless one first learns to comprehend the language in which it is', 'written. It is written in the language of mathematics...', ' ', 'G. Galilei, Il Saggiatore, 1623']
			\ ]

let g:startify_custom_header = map(s:startify_ascii_header +
        \ startify#fortune#quote(), '"   ".v:val')

let g:vimtex_view_general_viewer = 'zathura'

" Lua setup
lua<<EOF
require('lualine').setup({
	options = {
		icons_enabled = true
	}
})

require('tabline').setup({
	options = {
		show_devicons = true,
		show_tabs_always = true
		--show_bufnr = true
	}
})

require('telescope').load_extension('fzf')

require('neogit').setup()

-- require('lspsaga').init_lsp_saga()

-- require('nvim-tree').setup()

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local nvim_lsp = require('lspconfig')
local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}
require('rust-tools').setup(opts)

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require('cmp')
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF
