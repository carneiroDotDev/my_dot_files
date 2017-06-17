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
" Version 1.0:
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
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
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

"This will let Vundle manage Vundle (Its necessary)
Plugin 'VundleVim/Vundle.vim'
"The emmet plugin to make faster HTML/CSS typing
Plugin 'mattn/emmet-vim'
"The Solorized colorscheme
Plugin 'altercation/vim-colors-solarized'
"The vim-airline status bar
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'  "modify the theme (the normal one looks bad)
"see https://github.com/vim-airline/vim-airline/wiki/Screenshots for all the themes
"
" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
"The difference btw syntax on and syntax enable described by the VIM Helper:
"The ":syntax enable" command will keep your current color settings.  This
"allows using ":highlight" commands to set your preferred colors before or
"after using this command.  If you want Vim to overrule your settings with the
"defaults, use: >
"    :syntax on
if !exists("g:syntax_on")
    syntax enable
endif


"Turn on the solorized colorscheme
set background=light
colorscheme solarized
"There is also a darker look for the colorscheme
"set background=dark
"colorscheme solarized

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
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
"Vim will look when initializing also for a possible .vimrc/.exrc in the local 
"folder besides the ~/.vimrc to initialize with options.
set exrc

"I needed to change the font mainly because of Macvim:
"set guifont=Menlo:h14
set guifont=Monaco:h14
set spell spelllang=en_us
 
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
 
" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

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
set colorcolumn=85
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
    call append(0, "<!DOCTYPE HTML>")
    call append(1, "<html><head>")
    call append(2, "    <title></title>")
    call append(3, '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />')
    call append(4, '    <link rel="stylesheet" href="">')
    call append(6, '</head>')
    call append(7, '<body>')
    call append(8, '</body>')
    call append(9, '</html>')
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
set foldlevelstart=99
set nofoldenable

" Keymap to toggle folds with space
nmap <space> za
