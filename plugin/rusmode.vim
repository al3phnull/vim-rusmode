" Maintainer: Arseny Zarechnev <cyanidesign@gmail.com>
" Version: 0.3.1
" Last Modified: Apr 3, 2013
" License: Public domain.
" Url: http://www.vim.org/scripts/script.php?script_id=4493
" Description: Bind pressing russian key in normal mode to toggle layout and
" repeat same key.

if exists('g:loaded_rusmode') || &cp || version < 700
	finish
endif
let g:loaded_rusmode = 1
let s:is_mac = substitute(system('uname'), "\n", "", "") ==? 'Darwin'

" Check if system is not MacOS
if !s:is_mac
    " Must have commands for get and set layout
    if !exists('g:rusmode_get_layout_command')
        finish
    endif

    if !exists('g:rusmode_set_layout_command')
        finish
    endif
endif

if s:is_mac
    let s:current_dir = expand("<sfile>:p:h")
    let g:rusmode_get_layout_command = s:current_dir . '/../changeInput'
    let g:rusmode_set_layout_command = g:rusmode_get_layout_command
endif

if !exists('g:rusmode_normal_layout')
    let g:rusmode_normal_layout = 'U.S.'
endif


if !exists('g:rusmode_autotoggle_insertleave')
    let g:rusmode_autotoggle_insertleave = 0
endif

function s:ChangeLayout(key)
    let l:current_layout = substitute(system(g:rusmode_get_layout_command), "\n", "", "")
    if l:current_layout ==? g:rusmode_normal_layout
        if a:key ==? '/'
            return '.'
        elseif a:key ==? '?'
            return ','
        else
            return a:key
        endif
    endif
    call system(g:rusmode_set_layout_command . ' ' . g:rusmode_normal_layout)
    return a:key
endfunction

if g:rusmode_autotoggle_insertleave
    autocmd InsertLeave * call s:ChangeLayout("\<ESC>")
endif

nmap <expr> <unique> ю <SID>ChangeLayout('`')
nmap <expr> <unique> я <SID>ChangeLayout('q')
nmap <expr> <unique> в <SID>ChangeLayout('w')
nmap <expr> <unique> е <SID>ChangeLayout('e')
nmap <expr> <unique> р <SID>ChangeLayout('r')
nmap <expr> <unique> т <SID>ChangeLayout('t')
nmap <expr> <unique> ы <SID>ChangeLayout('y')
nmap <expr> <unique> у <SID>ChangeLayout('u')
nmap <expr> <unique> и <SID>ChangeLayout('i')
nmap <expr> <unique> о <SID>ChangeLayout('o')
nmap <expr> <unique> п <SID>ChangeLayout('p')
nmap <expr> <unique> ш <SID>ChangeLayout('[')
nmap <expr> <unique> щ <SID>ChangeLayout(']')
nmap <expr> <unique> а <SID>ChangeLayout('a')
nmap <expr> <unique> с <SID>ChangeLayout('s')
nmap <expr> <unique> д <SID>ChangeLayout('d')
nmap <expr> <unique> ф <SID>ChangeLayout('f')
nmap <expr> <unique> г <SID>ChangeLayout('g')
nmap <expr> <unique> х <SID>ChangeLayout('h')
nmap <expr> <unique> й <SID>ChangeLayout('j')
nmap <expr> <unique> к <SID>ChangeLayout('k')
nmap <expr> <unique> л <SID>ChangeLayout('l')
nmap <expr> <unique> ; <SID>ChangeLayout(';')
nmap <expr> <unique> ' <SID>ChangeLayout("'")
nmap <expr> <unique> з <SID>ChangeLayout('z')
nmap <expr> <unique> ь <SID>ChangeLayout('x')
nmap <expr> <unique> ц <SID>ChangeLayout('c')
nmap <expr> <unique> ж <SID>ChangeLayout('v')
nmap <expr> <unique> б <SID>ChangeLayout('b')
nmap <expr> <unique> н <SID>ChangeLayout('n')
nmap <expr> <unique> м <SID>ChangeLayout('m')
nmap <expr> <unique> , <SID>ChangeLayout(',')
nmap <expr> <unique> . <SID>ChangeLayout('.')
nmap <expr> <unique> | <SID>ChangeLayout('\')
nmap <expr> <unique> ¦ <SID>ChangeLayout('|')
nmap <expr> <unique> Ю <SID>ChangeLayout('¬')
nmap <expr> <unique> Я <SID>ChangeLayout('Q')
nmap <expr> <unique> В <SID>ChangeLayout('W')
nmap <expr> <unique> Е <SID>ChangeLayout('E')
nmap <expr> <unique> Р <SID>ChangeLayout('R')
nmap <expr> <unique> Т <SID>ChangeLayout('T')
nmap <expr> <unique> Ы <SID>ChangeLayout('Y')
nmap <expr> <unique> У <SID>ChangeLayout('U')
nmap <expr> <unique> И <SID>ChangeLayout('I')
nmap <expr> <unique> О <SID>ChangeLayout('O')
nmap <expr> <unique> П <SID>ChangeLayout('P')
nmap <expr> <unique> Ш <SID>ChangeLayout('{')
nmap <expr> <unique> Щ <SID>ChangeLayout('}')
nmap <expr> <unique> А <SID>ChangeLayout('A')
nmap <expr> <unique> С <SID>ChangeLayout('S')
nmap <expr> <unique> Д <SID>ChangeLayout('D')
nmap <expr> <unique> Ф <SID>ChangeLayout('F')
nmap <expr> <unique> Г <SID>ChangeLayout('G')
nmap <expr> <unique> Х <SID>ChangeLayout('H')
nmap <expr> <unique> Й <SID>ChangeLayout('J')
nmap <expr> <unique> К <SID>ChangeLayout('K')
nmap <expr> <unique> Л <SID>ChangeLayout('L')
nmap <expr> <unique> : <SID>ChangeLayout(':')
nmap <expr> <unique> " <SID>ChangeLayout('"')
nmap <expr> <unique> З <SID>ChangeLayout('Z')
nmap <expr> <unique> Ь <SID>ChangeLayout('X')
nmap <expr> <unique> Ц <SID>ChangeLayout('C')
nmap <expr> <unique> Ж <SID>ChangeLayout('V')
nmap <expr> <unique> Б <SID>ChangeLayout('B')
nmap <expr> <unique> Н <SID>ChangeLayout('N')
nmap <expr> <unique> М <SID>ChangeLayout('M')
nmap <expr> <unique> , <SID>ChangeLayout('<')
nmap <expr> <unique> . <SID>ChangeLayout('>')
nmap <expr> <unique> / <SID>ChangeLayout('/')
nmap <expr> <unique> ? <SID>ChangeLayout('?')
