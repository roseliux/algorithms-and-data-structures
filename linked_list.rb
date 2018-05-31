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
		  until current.next_node == @tail
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

	def find(value)
	end

	def remove(value)
	end

	def include?(value)
		each { |x| return true if value == x.value }
		false
	end
	
	def each
	  if block_given?
	  	current = @head
		  until current.nil?
		  	yield current
		  	current = current.next_node
		  end
	  end
	end

	def print
	  str = ''
	  each{|x| str << "#{x.value} --> " }
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

# p list.include?(1)
# p list.include?(3)
# p list.include?(22)

list.each { |x| p x }

# list.print
# list.remove_last
# list.print
# list.remove_last
# list.print
# list.remove_last
# list.print
# list.remove_last
# list.print
# list.remove_last
# list.remove_last
# list.remove_last
# list.print