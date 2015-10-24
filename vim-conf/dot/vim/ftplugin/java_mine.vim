inoremap 9 (
inoremap ( 9
inoremap 0 )
inoremap ) 0

nnoremap fr :! file=% && javac $file && java ${file\%.java}; rm ${file\%.java}.class;<CR>
