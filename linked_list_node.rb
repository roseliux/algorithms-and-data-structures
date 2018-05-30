class LinkedListNode

  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

first =  LinkedListNode.new(3)
middle = LinkedListNode.new(5)

first.next_node = middle


p first
