module DoublyLinkedList
	class DoublyLinkedList
		def initialize
			@head = nil
			@tail = nil
			@count = 0
		end

		def add_first(value)
		  node = Node.new(value)
		  
		  tmp = @head
		  @head = node
		  @head.next_node = tmp
		  if empty?
		   	@tail = @head
		  else
		  	tmp.previous_node = @head
		  end
		  @count += 1
		end

		def add_last(value)
		  node = Node.new(value)
		  
		  if empty?
		  	@head = node
		  else
		  	@tail.next_node = node
		  	node.previous_node = @tail
		  end

		  @tail = node
		  @count += 1
		end

		def remove_first
			return if empty?
			@head = @head.next_node
			@count -= 1
			@head.previous_node = nil unless empty?
			@tail = nil if empty?
		end

		def remove_last
			return if empty?
			if @count == 1
				@head = nil
				@tail = nil
			else
			  @tail.previous_node.next_node = nil
			  @tail = @tail.previous_node
			end
			@count -= 1
		end

		def clear
			@head = nil
			@tail = nil
			@count = 0
		end

		def empty?
			@count.zero?
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

		def each_reverse
			 if block_given?
		  	current = @tail
			  until current.nil?
			  	yield current
			  	current = current.previous_node
			  end
		  end
		end

		def print
		  str = ''
		  each{|x| str << "#{x.value} --> " }
		  str << 'null'
		  puts str
		end

		def print_reverse
			str = ''
		  each_reverse{|x| str << "#{x.value} --> " }
		  str << 'null'
		  puts str
		end
	end

	class Node
		attr_accessor :value, :next_node, :previous_node

	  def initialize(value = nil)
	    @value = value
	    @next_node = nil
	    @previous_node = nil
	  end
	end
end

double_linked_list = DoublyLinkedList::DoublyLinkedList.new
double_linked_list.add_first(1)
double_linked_list.add_first(2)
double_linked_list.add_first(3)
double_linked_list.print

double_linked_list.remove_last
double_linked_list.print

double_linked_list.remove_last
double_linked_list.print

double_linked_list.remove_last
double_linked_list.print

double_linked_list.remove_last
double_linked_list.print