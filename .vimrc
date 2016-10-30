"插件管理器pathogen使用，以后安装插件到~/.vimrc/bundle下即可，用来管理runtimepath
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect() 
Helptags

syntax enable "语法高亮，不用多说了。这个选项打开即可。

set number "显示行号

set tabstop=4 "TAB缩进4个字符

set softtabstop=4 "同上

set shiftwidth=4

set expandtab

"可以分解为3句话
"http://easwy.com/blog/archives/advanced-vim-skills-filetype-on/
"开启文件类型检测（filetype on）
"
"允许vim加载文件类型插件(iletype plugin
"on);当这个选项打开时，vim会根据检测到的文件类型，在runtimepath中搜索该类型的所有插件，并执行它们。
"
"允许vim为不同类型的文件定义不同的缩进格式(filetype indent
"on);在runtimepath的indent子目录中搜索缩进设置。对c类型的文件来说，它只是打开了cindent选项。
filetype plugin indent on

"使用solarized配色方案，安装在~/.vim/bundle/vim-colors-solarized
set background=dark "设置背景颜色，也可设置为light
let g:solarized_termcolors=256 "建议你强制写上这一行，表示使用256色配置方案
colorscheme solarized "设置主题为solarized



"快捷键设置--运行python程序
"方法1
"map <F5> :!python %<CR>
"map <F5> :call CompileRunPython()<CR>
"func! CompileRunPython()
"    exec "w"
"    exec "!python %"
"endfunc

"方法2
"map <F5> :!python %<CR>

"方法3
map <F5> <ESC>:w<CR>:call RunOneFile()<CR>
function! RunOneFile()
    if &filetype=='vim'
        source %
    elseif &filetype=='python'
        if expand('%:e')=='py3'
            !python3 %
        else
            !python %
        endif
    elseif &filetype=='c'
        if exists('g:ccprg')
            let b:ccprg = g:ccprg
        else
            let b:ccprg = 'gcc'
        endif
        exe '!' . b:ccprg . ' "' . expand('%:p') . '" -o "' . expand('%:p:r') . '"'
        exe '!' . expand('%:p:r')
    endif
endfunction
