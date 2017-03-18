let g:ctrlp_extensions = ['mixed', 'funky']
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window      = 'max:15,results:50'
let g:ctrlp_prompt_mappings   = {
      \   'PrtSelectMove("j")':   ['<C-j>', '<C-n>'],
      \   'PrtSelectMove("k")':   ['<C-k>', '<C-p>'],
      \   'PrtHistory(-1)':       ['<Down>'],
      \   'PrtHistory(1)':        ['<Up>'],
      \   'AcceptSelection("e")': ['<CR>'],
      \   'AcceptSelection("v")': ['<C-v>'],
      \   'PrtClearCache()':      ['<C-r>'],
      \   'PrtDeleteEnt()':       [''],
      \   'CreateNewFile()':      [''],
      \   'MarkToOpen()':         [''],
      \   'OpenMulti()':          [''],
      \   'PrtExit()':            ['<Esc>', '<C-c>', '<C-g>'],
      \ }
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn|gem)|(node_modules|bower_components|public\/assets|doc|.yardoc|tmp|log))$',
      \ 'file': '\.exe$\|\.so$\|\.dll$|\.min\.js\|.storyboard\|.xib\|.a',
      \ }

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif
