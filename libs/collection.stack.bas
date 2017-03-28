class node
	var dt = nil
	var link = nil
endclass

class stack
	var top = nil

	def empty()
		return top = nil
	enddef

	def push(d)
		n = new(node)
		n.dt = d

		if top = nil then
			top = n
		else
			n.link = top
			top = n
		endif
	enddef

	def pop()
		if top = nil then
			return nil
		endif

		n = top
		top = top.link

		return n.dt
	enddef
endclass
