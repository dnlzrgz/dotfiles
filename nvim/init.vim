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
set colorcolumn=80
set columns
set scrolloff=10
set cursorline

set clipboard=unnamedplus " use y and p with the system clipboard
set ignorecase
set hlsearch

set wildmenu

set background=dark
set t_Co=256

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

" Jupyter notebooks
Plug 'goerz/jupytext.vim'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

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

" Markdown
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}

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
" Jupytext
"==================================================
let g:jupytext_enable=1
let g:jupytext_command='jupytext'
let g:jupytext_fmt='md'

"==================================================
" Snippets
"==================================================
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

lua << EOF
    local ls=require("luasnip")
    local types=require("luasnip.util.types")

    require("luasnip.loaders.from_snipmate").lazy_load({paths="~/.config/nvim/snippets/"})

    ls.config.set_config{
        -- To make LuaSnip remembet the last snippet.
        history=true,

        -- Updates as you type.
        update_events="TextChanged,TextChangedI",
        delete_check_events="TextChanged",
        -- enable_autosnippets=true,
        ext_opts={
            [types.choiceNode]={
                active={
                    virt_text={{"<-", "Error"}},
                },
            },
        },
    }
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
    -- Disable newtr at the start
    vim.g.loaded=1
    vim.g.loaded_newtrPlugin=1

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
let g:vimwiki_key_mappings={'table_mappings': 0}
let g:vimwiki_list=[{
            \ 'path': '~/Documentos/Vault/',
            \ 'name': 'Vault',
            \ 'syntax': 'markdown',
            \'ext': '.md' }]

let g:vimwiki_markdown_link_ext=1

" Search in vimwiki files with grep. For example `:grep :python:`.
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

"==================================================
" Telescope
"==================================================
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"==================================================
" CMP
"==================================================
set completeopt=menu,menuone,noselect

lua << EOF
    -- Set up nvim-cmp.
    local cmp=require'cmp'

    cmp.setup({
        snippet={
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name='nvim_lsp' },
            { name='luasnip' },
        }, {
            { name='buffer' },
        })
    })

    cmp.setup.filetype('gitcommit', {
        sources=cmp.config.sources({
            { name='cmp_git' },
        }, {
            { name='buffer' },
        })
    })

    cmp.setup.cmdline('/', {
        mapping=cmp.mapping.preset.cmdline(),
        sources={
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        mapping=cmp.mapping.preset.cmdline(),
        sources=cmp.config.sources({
            { name='path' }
        }, {
            { name='cmdline' }
        })
    })

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    require('lspconfig')['dockerls'].setup{capabilities = capabilities}
    -- require('lspconfig')['marksam'].setup{capabilities = capabilities}
    require('lspconfig')['pyright'].setup{capabilities = capabilities}
    -- require('lspconfig')['simneko_lua'].setup{capabilities = capabilities}
    require('lspconfig')['vimls'].setup{capabilities = capabilities}
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
