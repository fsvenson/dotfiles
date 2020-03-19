highlight Cursor guifg=white guibg=red
highlight iCursor guifg=white guibg=green
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i-ci:blinkwait10
set guicursor+=i-ci:ver10-iCursor
set mouse=a

if exists('g:GtkGuiLoaded')
  " some code here
  call rpcnotify(1, 'Gui', 'Font', 'Inconsolatazi4 Medium 10')
endif
