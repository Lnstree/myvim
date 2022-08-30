set t_Co=256   " This is may or may not needed.


set backspace=indent,eol,start
syntax on
set nocompatible                       " 关闭兼容模式
filetype off                           " 关闭对文件类型的自动检测
"set rtp+=~/.vim/bundle/Vundle.vim      " 加入运行时路径
set rtp+=~/myvim/Vundle.vim
call vundle#begin()                    " 初始化" 插件列表开始
Plugin 'VundleVim/Vundle.vim'          " 插件列表1
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'joshdick/onedark.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'racer-rust/vim-racer'          " 插件列表1
Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'preservim/nerdcommenter'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
call vundle#end()                      " 完成
filetype plugin indent on              " 打开文件类型检测

"set background=dark     " 黑暗模式
colorscheme onedark
"set background=light
"colorscheme PaperColor  
set autoread 		

" delimitMate settings 括号对齐
let delimitMate_expand_cr = 1  	 "需要backspace包含start,eol
let delimitMate_expand_space = 1 "需要backspace包含start,eol


set laststatus=2
set completeopt-=preview
set tabstop=4
set shiftwidth=4
set showcmd

"set foldmethod=syntax
set hlsearch      "搜索高亮
set scrolloff=10  "底部留10行
set autowrite

set nu
"set relativenumber

"set cursorline


"记住上次光标位置
if has("autocmd")                                                          
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endif 


"netree 自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")  && b:NERDTree.isTabTree()) | q | endif


let g:ycm_global_ycm_extra_conf="/root/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_semantic_highlighting=1


if executable('rls')
	    au User lsp_setup call lsp#register_server({
	            \ 'name': 'rls',
	            \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
	            \ 'whitelist': ['rust'],
	            \ 'rust-analyzer.cargo.runBuildScripts': 'true',
	            \ })
endif 



" key binds
nmap <Leader>n :NERDTreeToggle<CR>
nmap <C-p> :FZF <CR>
nmap <C-b> :Buffers <CR>
nmap <Leader>g :YcmCompleter GoToDefinition<CR>
nmap <Leader>f :YcmCompleter GoToReferences<CR>
nmap <Leader>d :YcmDiags<CR>

"rust
nnoremap <F5> :!cargo run<CR>


