' Intersection
' Union
' Difference

def reversed(l)
	if not l is type("list") then
		return nil
	endif

	ret = list()
	while len(l) <> 0
		push(ret, pop(l))
	wend

	return ret
enddef

def car(l)
	if not (l is type("list")) then
		return nil
	endif

	if len(l) = 0 then
		return nil
	endif

	return l(0)
enddef

def cdr(l)
	if not (l is type("list")) then
		return nil
	endif

	if len(l) = 0 then
		return nil
	endif

	ret = clone(l)
	remove(ret, 0)

	return ret
enddef

class dict_iterator_node
	var key = nil
	var value = nil
endclass

def sorted_iterator(d)
	l = list()
	i = iterator(d)
	while move_next(i)
		push(l, get(i))
	wend
	sort(l)

	i = iterator(l)
	n = new(dict_iterator_node)

	return lambda()
	(
		if not move_next(i) then
			return nil
		endif

		k = get(i)
		n.key = k
		n.value = d(k)

		return n
	)
enddef
