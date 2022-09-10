"==================================================
" General
"==================================================
syntax on

set encoding=UTF-8
set ma
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread
set nobackup
set nowritebackup
set noswapfile
set nu
set foldlevelstart=99
set scrolloff=10

set clipboard=unnamedplus " use y and p with the system clipboard
set ignorecase
set hlsearch

set wildmenu

"==================================================
" Leader
"==================================================
let mapleader=','

"==================================================
" Plugins
"==================================================
call plug#begin('~/.config/nvim/autoload/')

" Theme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" LSP & Autocompletition
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snips
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.0'}

" Git
Plug 'TimUntersberger/neogit'

" File explorer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Autopairs
Plug 'windwp/nvim-autopairs'
call plug#end()

"==================================================
" LSP servers
"==================================================
lua << EOF
    require("nvim-lsp-installer").setup()
EOF

"==================================================
" Colorscheme
"==================================================
let g:catppuccin_flavour='frappe'

lua << EOF
    require("catppuccin").setup({
    integrations={
        cmp=true,
        markdown=true,
        neogit=true,
        telescope=true,
        vimwiki=true,
    },
    })
EOF

colorscheme catppuccin

"==================================================
" File explorer
"==================================================
nnoremap <leader>d :NvimTreeToggle<cr>

lua << EOF
    require("nvim-tree").setup({
        sort_by="case_sensitive",
        view={
            adaptive_size=true,
        },
        renderer={
            group_empty=true,
        },
        filters={
            dotfiles=false,
        },
    })
EOF

"==================================================
" Autopairs
"==================================================
lua << EOF
    require("nvim-autopairs").setup{}
EOF

"==================================================
" Vimwiki
"==================================================
let g:vimwiki_list=[{'path': '~/Documentos/Vault/',
            \ 'syntax': 'markdown', 'ext': '.md' }]

"==================================================
" Telescope
"==================================================
nnoremap <leader>ff<cmd>Telescope find_files<cr>
nnoremap <leader>fg<cmd>Telescope live_grep<cr>
nnoremap <leader>fb<cmd>Telescope buffers<cr>
nnoremap <leader>fh<cmd>Telescope help_tags<cr>

"==================================================
" CMP
"==================================================
set completeopt=menu,menuone,noselect

lua << EOF
    local cmp=require('cmp')

    cmp.setup({
        snippet={
            expand=function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        window={
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>']=cmp.mapping.scroll_docs(-4),
            ['<C-f>']=cmp.mapping.scroll_docs(4),
            ['<C-Space>']=cmp.mapping.complete(),
            ['<C-e>']=cmp.mapping.abort(),
            ['<CR>']=cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            {name='nvim_lsp'},
            {name='vsnip'},
            },
        {
             {name='buffer'},
        })
    })
EOF

"==================================================
" Treesitter
"==================================================
lua << EOF
    require('nvim-treesitter.configs').setup({
        ensure_installed={"lua", "python"},
        auto_install=true,
        highlight={
            enable=true,
        },
    })
EOF

"==================================================
" Status line
"==================================================
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2
