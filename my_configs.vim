if has("win32")
	set guifont=Hack:h12
	let plug = "~\\vimfiles\\plugged"
else
	set guifont=Monaco:h14
	let plug = "~/.vim/plugged"
endif

if has("gui_running")
    set lines=60 columns=180
endif

set nu

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" unix:    put into ~/.vim/autoload/plug.vim
" windows: put into ~\vimfiles\autoload\plug.vim
call plug#begin(plug)
" completion/coding
  Plug 'Valloric/YouCompleteMe'
  Plug 'jiangmiao/auto-pairs' "自动括号匹配
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/vim-easy-align'
" looking
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/syntastic'
  Plug 'myusuf3/numbers.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'airblade/vim-gitgutter'
  Plug 'altercation/vim-colors-solarized'
" utils
  Plug 'asins/vimcdoc'
  Plug 'rhysd/nyaovim-markdown-preview'
  Plug 'kassio/neoterm'
" navigation
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'vim-scripts/taglist.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'wesleyche/SrcExpl'
  Plug 'majutsushi/tagbar'
  Plug 'rizzatti/dash.vim'
" c/c++
" java
  Plug 'artur-shaik/vim-javacomplete2'
" html/css/javascript
  Plug 'mattn/emmet-vim'
  Plug 'leshill/vim-json'
  Plug 'mustache/vim-mustache-handlebars'
" scala
  Plug 'ensime/ensime-vim'
  Plug 'derekwyatt/vim-scala'
" Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'iamcco/mathjax-support-for-mkdp'
  Plug 'iamcco/markdown-preview.vim'
" Initialize plugin system
call plug#end()

set background=dark
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    map <leader>sh :bo sp term://bash\|resize 5<CR>i
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set splitright

let g:NERDTreeWinPos = "left"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

nnoremap <leader>jd :YcmCompleter GoTo

" airline
let g:airline#extensions#tabline#enabled = 1

nmap t1 <Plug>AirlineSelectTab1
nmap t2 <Plug>AirlineSelectTab2
nmap t3 <Plug>AirlineSelectTab3
nmap t4 <Plug>AirlineSelectTab4
nmap t5 <Plug>AirlineSelectTab5
nmap t6 <Plug>AirlineSelectTab6
nmap t7 <Plug>AirlineSelectTab7
nmap t8 <Plug>AirlineSelectTab8
nmap t9 <Plug>AirlineSelectTab9
nmap t[ <Plug>AirlineSelectPrevTab
nmap t] <Plug>AirlineSelectNextTab

let Tlist_Sort_Type="name" " order by

let Tlist_Compact_Format=1
"Tlist_Exit_OnlyWindow need not set, if it's part of Win Manager
let Tlist_Exit_OnlyWindow=1 " if you are the last,kill yourself

" Automatically close the folds for the non-active files in the taglist window
let Tlist_File_Fold_Auto_Close=1
let Tlist_Enable_Fold_Column=0 " Do not show folding tree

"show Tlist's menu and mouse right button click menu£¬only support by taglist.vim 4.0 beta and older
let Tlist_Show_Menu=0

"Display the tags for only one file in the taglist window
let Tlist_Show_One_File=1

"Tlist_Auto_Open need not set, if it's part of Win Manager
"Display tag prototypes or tag names in the taglist window
let Tlist_Display_Tag_Scope=1
let Tlist_Close_On_Select=1
let Tlist_Display_Prototype=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Process_File_Always=0

let Tlist_Ctags_Cmd='ctags' " Location of ctags
let Tlist_Use_Right_Window = 1

if has('win32')
    let g:mkdp_path_to_chrome = "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"
else
    let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
endif

nnoremap <silent> <F2> :tabp<CR>
nnoremap <silent> <F3> :tabn<CR>
nnoremap <silent> <F4> ggVGy:tabnew<cr>Pgg
nnoremap <silent> <F5> gg=G

set foldmethod=syntax

inoremap <F6> <C-O>za
nnoremap <F6> za
onoremap <F6> <C-C>za
vnoremap <F6> zf

nmap <F7> :SrcExplToggle<CR>

nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

nnoremap <silent> <F10> :TlistToggle<CR>

function AddTitle()
	call append( 0,"///////////////////////////////////////////////////////////////////////////")
	call append( 1,"//")
	call append( 2,"//	File: ".expand("%:t"))
	call append( 3,"//  Description: ")
	call append( 4,"//")
	call append( 5,"//	Copyright (c) 2009 by Thomson Reuters. All rights reserved.")
	call append( 6,"//")
	call append( 7,"// No portion of this software in any form may be used or ")
	call append( 8,"// reproduced in any manner without written consent from ")
	call append( 9,"// Thomson Reuters")
	call append(10,"//")
	call append(11,"//    $Id$")
	call append(12,"//") 
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

"update last modify time and file name
function UpdateTitle()
	normal m'
	execute '/# *MODIFIED:/s@:.*$@\=strftime(":  %Y-%m-%d %H:%M:%S %z")@'
	normal ''
	normal mk
	execute '/# *FILE:/s@:.*$@\=":\t\t".expand("%:t")@'
	execute "noh"
	normal 'k
	echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

"update title in first 10 lines if not find, add new
function TitleDet() 
    let n=1
	"add as default
	while n < 20
		let line = getline(n)
		if line =~ '^\#\s*\S*MODIFIED:\S*.*$'
			call UpdateTitle()
			return
		endif
		let n = n + 1
	endwhile
	call AddTitle()
endfunction

nnoremap <silent> <F11> ms:call TitleDet()<cr>'s
