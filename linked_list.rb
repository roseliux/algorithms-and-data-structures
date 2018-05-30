require './linked_list_node'

class LinkedList

	def initialize
		@head = nil
		@tail = nil
		@count = 0
	end

	def add_first(value)
	  node = LinkedListNode.new(value)
	  tmp = @head
	  @head = node
	  @count += 1
	  @head.next_node = tmp

	  @tail = @head if @count == 1
	end

	def add_last(value)
	  node = LinkedListNode.new(value)
	  
	  if @count.zero?
	  	@head = node
	  else
	  	@tail.next_node = node
	  end

	  @tail = node
	  @count += 1
	end

	def remove_first
		return if @count.zero?
		@head = @head.next_node
		@count -= 1
		@tail = nil if @count.zero?
	end

	def remove_last
		return if @count.zero?
		if @count == 1
			@head = nil
			@tail = nil
		else
		  current = @head
		  while current.next_node != @tail
		    current = current.next_node
		  end
		  @tail = current
		  @tail.next_node = nil
		end
		@count -= 1
	end

	def clear
		@head = nil
		@tail = nil
		@count = 0
	end

	def print
	  str = ''
	  current = @head
	  until current.nil?
		str << "#{current.value.to_s} --> "
	  	current = current.next_node
	  end
	  str << 'null'
	  puts str
	end
end


list = LinkedList.new
list.clear
list.add_last(1)
list.add_last(2)
list.add_last(3)
list.add_last(99)

list.remove_last
list.print
list.remove_last
list.print
list.remove_last
list.print
list.remove_last
list.print
list.remove_last
list.remove_last
list.remove_last
list.print