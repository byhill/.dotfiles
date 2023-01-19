setlocal suffixesadd^=.lua
setlocal suffixesadd^=init.lua
let &l:path .= ','.stdpath('config').'/lua'
