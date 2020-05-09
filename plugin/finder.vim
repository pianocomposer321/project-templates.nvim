fun! FilterClose(bufnr)
	wincmd p
	execute "bwipe" a:bufnr
	redraw
	echo "\r"
	return []
endf

fun! Finder(input, prompt) abort
	let l:prompt = a:prompt . '>'
	let l:filter = ""
	let l:undoseq = []
	botright 10new +setlocal\ buftype=nofile\ bufhidden=wipe\
				\ nobuflisted\ nonumber\ norelativenumber\ noswapfile\ nowrap\
				\ foldmethod=manual\ nofoldenable\ modifiable\ noreadonly
	let l:cur_buf = bufnr('%')
	if type(a:input) ==# v:t_string
		let l:input = systemlist(a:input)
		call setline(1, l:input)
	else " Assume List
		call setline(1, a:input)
	endif
	setlocal cursorline
	redraw
	echo l:prompt . " "
	while 1
		let l:error = 0 " Set to 1 when pattern is invalid
		try
			let ch = getchar()
		catch /^Vim:Interrupt$/  " CTRL-C
			return FilterClose(l:cur_buf)
		endtry
		if ch ==# "\<bs>" " Backspace
			let l:filter = l:filter[:-2]
			let l:undo = empty(l:undoseq) ? 0 : remove(l:undoseq, -1)
			if l:undo
				silent norm u
			endif
		elseif ch >=# 0x20 " Printable character
			let l:filter .= nr2char(ch)
			let l:seq_old = get(undotree(), 'seq_cur', 0)
			try " Ignore invalid regexps
				execute 'silent keepp g!:\m' . escape(l:filter, '~\[:') . ':norm "_dd'
			catch /^Vim\%((\a\+)\)\=:E/
				let l:error = 1
			endtry
			let l:seq_new = get(undotree(), 'seq_cur', 0)
			" seq_new != seq_old iff the buffer has changed
			call add(l:undoseq, l:seq_new != l:seq_old)
		elseif ch ==# 0x1B " Escape
			return FilterClose(l:cur_buf)
		elseif ch ==# 0x0D " Enter
			let l:result = empty(getline('.')) ? [] : [getline('.')]
			call FilterClose(l:cur_buf)
			return l:result
		elseif ch ==# 0x0C " CTRL-L (clear)
			call setline(1, type(a:input) ==# v:t_string ? l:input : a:input)
			let l:undoseq = []
			let l:filter = ""
			redraw
		elseif ch ==# 0x0B " CTRL-K
			norm k
		elseif ch ==# 0x0A " CTRL-J
			norm j
		endif
		redraw
		echo (l:error ? "[Invalid pattern] " : "").l:prompt l:filter
	endwhile
endf
