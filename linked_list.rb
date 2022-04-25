class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = Node.new
  end
  def append(node)
    node = Node.new(node)
    if !@head.pointer && !@head.data
      @head = node
    else
      current_node = @head
      current_node = current_node.pointer until current_node.pointer.nil?
      current_node.pointer = node
    end
  end
  def prepend(node)
    if !@head.pointer && !@head.data
      node = Node.new(node)
      @head = node
    else
      node = Node.new(node, @head)
      @head = node
    end
  end
  def size
    if @head.pointer.nil?
      0
    else
      size_count = 1
      current_node = @head
      until current_node.pointer.nil?
        current_node = current_node.pointer
        size_count += 1
      end
      size_count
    end
  end
  def head 
    @head
  end
  def tail
    current_node = @head
    until current_node.pointer.nil?
      current_node = current_node.pointer
    end
    current_node
  end
  def at(index)
    if self.size < index + 1
      return "No such Index"
    else
      current_index = 0
      current_node = @head
      until current_index == index
        current_node = current_node.pointer
        current_index += 1
      end
      current_node
    end
  end
  def pop
    if @head.pointer.nil?
      @head.data = nil
      @head.pointer = nil
    else
      current_node = @head
      until current_node.pointer.pointer.nil?
        current_node = current_node.pointer
      end
      current_node.pointer = nil
      @head
    end
  end
  def contains?(value)
    current_node = @head
    until current_node.pointer.nil? || current_node.data == value
      current_node = current_node.pointer
    end
    if current_node.data == value
      true
    else
      false
    end
  end
  def find(value)
    current_node = @head
    index = 0
    until current_node.pointer.nil? || current_node.data == value
      current_node = current_node.pointer
      index += 1
    end
    if current_node.data == value
      index
    else
      nil
    end
  end
  def to_s
    string = " "
    current_node = @head
    until current_node.pointer.nil?
      string += "( #{current_node.data} ) -> "
      current_node = current_node.pointer
    end
    string += "( #{current_node.data} ) -> nil "
  end
  def insert_at(value, index)
    if self.size < index 
      return "No such Index"
    else
      current_index = 0
      current_node = @head
      while current_index < index - 1
        current_node = current_node.pointer
        current_index += 1
      end
      if current_index == 0 && index != 1
        @head = Node.new(value, @head.pointer)
      else
        value = Node.new(value, current_node.pointer)
        current_node.pointer = value
      end
    end
  end
  def remove_at(index)
    if self.size < index + 1
      return "No such Index"
    else
      current_index = 0
      current_node = @head
      while current_index < index - 1
        current_node = current_node.pointer
        current_index += 1
      end
      @head = current_node.pointer if current_index == 0 && index != 1
      current_node.pointer = current_node.pointer.pointer
    end
  end
end

class Node
  def initialize(data = nil, pointer = nil)
    @data = data
    @pointer = pointer
  end
  attr_accessor :pointer, :data
end