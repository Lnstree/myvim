set t_Co=256   " This is may or may not needed.


set backspace=indent,eol,start
syntax on
set nocompatible                       " 关闭兼容模式
filetype off                           " 关闭对文件类型的自动检测
set rtp+=~/.vim/bundle/Vundle.vim      " 加入运行时路径
call vundle#begin()                    " 初始化" 插件列表开始
Plugin 'VundleVim/Vundle.vim'          " 插件列表1
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'racer-rust/vim-racer'          " 插件列表1
Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'rust-lang/rust.vim'

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
call vundle#end()                      " 完成
filetype plugin indent on              " 打开文件类型检测

set background=dark     " 黑暗模式
colorscheme PaperColor  
set autoread 		

set laststatus=2
set completeopt-=preview
set tabstop=4
set shiftwidth=4

set foldmethod=syntax
set hlsearch      "搜索高亮
set scrolloff=10  "底部留10行
set autowrite

set nu
set relativenumber

set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white


"记住上次光标位置
if has("autocmd")                                                          
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endif 




"let g:ycm_rust_src_path = "/root/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/"

let g:ycm_rust_src_path = "/root/rust/src/libstd/"
let g:ycm_confirm_extra_conf=0


if executable('rls')
	    au User lsp_setup call lsp#register_server({
	            \ 'name': 'rls',
	            \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
	            \ 'whitelist': ['rust'],
	            \ })
endif 



" key binds
nmap <Leader>n :NERDTreeToggle<CR>
nmap <C-p> :FZF <CR>
nmap <C-b> :Buffers <CR>
nmap <Leader>g :YcmCompleter GoToDefinition<CR>
nmap <Leader>f :YcmCompleter GoToReferences<CR>
