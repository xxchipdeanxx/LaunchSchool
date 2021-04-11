class Element
  attr_accessor :next

  def initialize(data, next_element = nil)
    @data = data
    @next = next_element
  end

  def datum
    @data
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :curr_index, :list
  def initialize
    @list = []
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?
    array.reverse.each {|data| list.push(data)}
    list
  end

  def to_a
    result = []
    @list.each {|element| result << element.datum}
    result
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(data)
    @list.prepend(Element.new(data))
    head.next = @list[1] unless size == 1
  end

  def peek
    return nil if empty?
    head.datum
  end

  def head
    @list[0]
  end

  def pop
    @list.shift.datum
  end
end
