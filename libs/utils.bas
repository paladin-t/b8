' Iteration.
def foreach(c, f)
	if c is type("list") then
		i = iterator(c)
		while move_next(i)
			v = get(i)
			f(v)
		wend
	elseif c is type("dict") then
		i = iterator(c)
		while move_next(i)
			k = get(i)
			v = c(k)
			f(k, v)
		wend
	endif
enddef

' Multiple condition.
def select(...)
	l = len(...)
	for i = 0 to l - 1 step 2
		if ... then
			_ = ...
			_()
			return
		else
			_ = ...
		endif
	next
enddef

' Auto closing context.
def with(p, f)
	f(p)
	p.close()
enddef

' Joins a collection to a string.
def join(lst, sep)
	ret = ""
	l = len(lst)
	for i = 0 to l - 1
		ret = ret + lst(i)
		if i <> l - 1 then
			ret = ret + sep
		endif
	next

	return ret
enddef
