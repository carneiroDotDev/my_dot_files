"
" 
" Version 1.1:
" URL: 
" Authors: Luiz Carneiro - 13/03/2017
" Description: I have developed my .vimrc file upon the one described below. 
"           1) The relative line number is set together with the number of the 
"              actual line. (set rnu nu)
"           2) I always use set noncompatible for safety reasons. It follows a 
"              a chunck of the vi compatible-default documentation:
"             -- When Vim starts, the 'compatible' option is on. This will be used 
"              when Vim starts its initializations. But as soon as a user vimrc 
"              file is found, or a vimrc file in the current directory, or the 
"              "VIMINIT" environment variable is set, it will be set to 'nocompatible'. --
"              Therefore it makes no sense THEORETICALLY to use this option once we are 
"              setting here a .vimrc file. However why not? ;) 
"           3) Presently I am writing this in Munich - Germany and once in a while it is 
"              necessary to write some umlaut (ä = type 'a' erase with CTRL-H and tїpe ':').
"              That is why I will set the option set digraph.
"           4) Took out the set hidden option. I preffer to work with tabs. See along the 
"              file the description of such option.
"           5) set wildmenu and set wildmode=list:longest,full to make auto completion possible. 
"              For example: Enter in option mode with ':' type s and press <tab>.
"                           It will give you some autocompletion possibilities with a long-list (wildmode).
"           6) As one can see when writing this I had not yet set the maximum of 
"              columns write ;). So lets do it with: set textwidth=90
"              It is good to note that it may be a little dangerous when programming. A
"              feature which would make this 'safer' would be to highlight the maximum 
"              column where we can go to. Also to wrap the line is an option. I will think
"              about that for a next version (I dont like that colorful stripe when 
"              highlighting a column).
"           7) In case of vimdiff, show the whole file. It includes the lines which are
"              identical in both files. 
              if &diff                             " only for diff mode/vimdiff
              set diffopt=filler,context:1000000   " filler is default and inserts empty lines for sync
              endif
"
" a first reference to write this file was:
" URL: http://vim.wikia.com/wiki/Example_vimrc
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Use 256 colors in vim
" some plugins not work without it
set t_Co=256
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
"This will call Vundle which is the best VIM plugin manager
"Vundle requires filetype to be off initially, but once you’re finished 
"adding Bundles, you can set it to be on again.
" filetype off R.I.P Vundle 15/10/2017
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim/  R.I.P Vundle 15/10/2017 (vim-pug handles it) 

" call vundle#begin()   R.I.P Vundle 15/10/2017 (vim-pug handles it) 
call plug#begin('~/.vim/plugged')
" :PlugnInstall

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

"This will let Vundle manage Vundle (Its necessary)
"  Plugin 'VundleVim/Vundle.vim' R.I.P Vundle 15/10/2017 (vim-pug handles it) 
"The emmet plugin to make faster HTML/CSS typing
Plug 'mattn/emmet-vim'
"The Solorized colorscheme
"Plug 'altercation/vim-colors-solarized'
"The vim-airline status bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'  "modify the theme (the normal one looks bad)
"see https://github.com/vim-airline/vim-airline/wiki/Screenshots for all the themes
Plug 'Yggdroot/indentLine'   "Add an indentation line 
"
"Vim Surround plug in. (Ex. cs" ' or cst") 
Plug 'tpope/vim-surround'
"
"Javascript syntax highlight
Plug 'jelera/vim-javascript-syntax'
"
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
"
"Syntastic Plugin 
"Plug 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ['HTML']

" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#7edee5'

" none X terminal
let g:indentLine_color_tty_light = 4 " (default: 4)
let g:indentLine_color_dark = 2 " (default: 2)

" Background (Vim, GVim)
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = '|'
"let g:indentLine_setConceal = 3
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_html_checkers = ['HTML']
"
"
" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
Plug 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
" call vundle#end()  R.I.P Vundle 15/10/2017 (vim-pug handles it) 
call plug#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" filetype indent plugin on R.I.P Vundle 15/10/2017 (vim-pug handles it) 
 
"The difference btw syntax on and syntax enable described by the VIM Helper:
"The ":syntax enable" command will keep your current color settings.  This
"allows using ":highlight" commands to set your preferred colors before or
"after using this command.  If you want Vim to overrule your settings with the
"defaults, use: >
"    :syntax on
"if !exists("g:syntax_on")
"    syntax enable         R.I.P Vundle 15/10/2017 (vim-pug handles it) 
"endif


"Turn on the solorized colorscheme
" set background=light
" colorscheme solarized
"There is also a darker look for the colorscheme
" set background=dark
" colorscheme solarized

"This will differenciate the colorscheme look depending 
"if onw is using the GUI version or the terminal version of VI:
"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif
"
"Let the vim-airline customize the tabs:
let g:airline#extensions#tabline#enabled = 1
"set the theme for vim-airline
let g:airline_theme='papercolor'

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
" set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
" Enable auto completion in the option mode: (see version 1.1 comments (5))
set wildmode=list:longest,full
 
" Show partial commands in the last line of the screen
set showcmd

" Highlight the line where the cursor is
set cursorline

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
set incsearch " search while typing 
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
"Vim will look when initializing also for a possible .vimrc/.exrc in the local 
"folder besides the ~/.vimrc to initialize with options.
set exrc

"I needed to change the font mainly because of Macvim:
"set guifont=Menlo:h14
"set guifont=Monaco:h14
set spell spelllang=en_us
"set guifont=Monaco:h14
"set guifont=Inconsolata\ for\ Powerline:h18
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set linespace=1
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" It allows to write special characters like さ or ä
" set digraph
 
" Allow backspacing over autoindent, line breaks and start of insert action
"set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Maximum column width:
set textwidth=90
 
" Display line numbers on the left
" set number
set relativenumber
set number
 
" Quickly time out on keycodes, but never time out on mappings
" set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" In case you want to justify text, use the command "_j"
ru macros/justify.vim
" I particularly prefer to select the lines and use "gw".
" This will not justify but will insert line breaks and 
" format the text until a maximum column.
"
set lazyredraw   " redraw only when necessary
set showmatch    "highlight [],{},()
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
" Luiz says: 'Take much care if you uncomment these lines.'
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
"To highlight the recent inserted text press ``
nnoremap gV `[v`]

"One can use ESC or the sequence
inoremap jk <esc>

" Vim as default maps help as F1. I will substitute this mapping for <ESC>,
" because sometimes I want to exit the insert mode and I type F1 instead of ESC.
map <F1> <ESC>
imap <F1> <ESC>

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
" nnoremap <C-L> :nohl<CR><C-L>

map  <C-l> :tabn<CR>    "Move to next tab
map  <C-h> :tabp<CR>    "Move to previous tab
map  <C-n> :tabnew<CR>  "Create new tab

"set list
"set listchars=tab:>-    "Two characters to be used to show a tab.  The first
                        "char is used once.  The second char is repeated to
                        "fill the space that the tab normally occupies.
                        ""tab:>-" will show a tab that takes four spaces as
                        "">---".  When omitted, a tab is show as ^I.
"set listchars=eol:$     Show end of lines as $"

" HTML maping 
imap <A-p> <p class="">
imap <S-A-p> </p>

imap <S-A-c> console.log("");

imap <A-d> <div class="">
imap <S-A-d> </div>

imap <A-a> <a calss="" href="">
imap <S-A-a> </a>

imap <S-A-i> <img src="" alt="">

imap <A-t> <h1>
imap <S-A-t> </h1>

ab lorem1 Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. 
ab lorem2 Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. 
ab lorem3 Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. 
ab lorem4 Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. 
ab lorem5 Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. 
ab lorem6 Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

"------Appendix 1  - Using VIM for writing plain text--------
"
"I this section I will write a function which should be called 
"when plain text will be written. This will set some useful options 
"to make writing (and not coding) in VIM more pleasurable.
"
func! VimToWriteMode() 
    "At first I will let saved here some welcome commands, just so:

"   3diw   —delete inside the current word and the next two words
"   dwwP   —swap the current word with the next word
"   d?foo  —delete from the cursor to the previous string “foo”
"   ct.    —change from the cursor until the next period
"   d^     —delete from the cursor to the beginning of the line
"   d>D    —delete from the cursor to the end of the line
"   2J     —join the current line with the line below
"   das    —delete around the current sentence
"   c(     —change from the cursor to the beginning of a sentence
"   >}     —go to the end of the current paragraph
"   dapP   —swap current paragraph with the next paragraph


"I will not wrap the text until some column, because it always 
"somehow appears the wish to make a really long line or comment.
"I will simply highlight a column with a nice soft color (pinkish)
"to have an idea when the text is going too far.
set colorcolumn=75
"Maybe you want another color? 
highlight ColorColumn ctermbg=0 guibg=lightred
"
" setlocal formatoptions=1 
" setlocal noexpandtab 
" map j gj 
" map k gk
" setlocal spell spelllang=en_us 
" set nospell  " just to remember
" set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
" set complete+=s
" set formatprg=par
" setlocal wrap 
" setlocal linebreak 
endfu 
com! VW call VimToWriteMode()
"------------------------------------------------------------
" Functions 
"
"Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus cursor in new document
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

"Create HTML basic tags when vim is called with a file *.html
autocmd BufNewFile  *.html  call    Generate_html()

function! Generate_html()
    call append(0,  '<!DOCTYPE HTML>')
    call append(1,  '<html lang="en">')
    call append(2,  '<head>')
    call append(3,  '  <title>Function written in my .vimrc</title>')
    call append(4,  '  <meta charset="utf-8">')
    call append(6,  '  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">')
    call append(7,'')
    call append(8,  '       <!-- Bootstrap CDN -->')
    call append(9,  '  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">-->')
    call append(10, '       <!-- Bootstrap SASS -->')
    call append(11, '  <!-- <link rel="stylesheet" href="node_modules/bootstrap/compiler/bootstrap.css"> -->')
    call append(12, '       <!-- Main stylesheet -->')
    call append(13, '  <!-- <link rel="stylesheet" href="" />-->')
    call append(14, '  <!-- <style type="text/css">-->')
    call append(15, '  <!-- </style> -->')
    call append(16, '</head>')
    call append(17, '<body>')
    call append(18,'   <h1 class="title"> Hello World! </h1>')
    call append(19,'       <!-- Optional JavaScript -->')
    call append(20,'       <!-- jQuery first, then Popper.js, then Bootstrap JS -->')
    call append(21,'   <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->')
    call append(22,'   <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>-->')
    call append(23,'   <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>--> ')
    call append(24,'       <!-- Optional JavaScript -->')
    call append(25,'       <!-- jQuery first, then Popper.js, then Bootstrap JS -->')
    call append(26,'   <!-- <script src="node_modules/jquery/dist/jquery.js"></script>-->')
    call append(27,'   <!-- <script src="node_modules/popper.js/dist/umd/popper.js"></script>-->')
    call append(28,'   <!-- <script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>-->')
    call append(29,'       <!-- Main JavaScript -->')
    call append(30,'   <!-- <script src="js/script.js"></script>-->')
    call append(31,'</body>')
    call append(32,'</html>')
endfunction

autocmd BufNewFile  *.pro  call    Generate_idl()

function! Generate_idl()
    call append(0, "pro")
    call append(1, "loadct,12")
    call append(3, "return")
    call append(4, "end")
endfunction

autocmd BufNewFile  *.sh  call    Generate_sh()

function! Generate_sh()
    call append(0, "#!/bin/bash")
    call append(1, "#")
endfunction
"------------------------------------------------------------
" Folding

" Enable syntax folding in javascript
let javaScript_fold=1

" No fold closed at open file
set foldenable

"Starting fold level when opening a new file
"if 0, all folds will be closed 
"if 99, all fold are opened  
set foldlevelstart=99   

"Folds can be also nested until a max
set foldnestmax=10

" Keymap to toggle folds with space
 nnoremap <space> za

 " Fold in respect to the indent level
 set foldmethod=indent
