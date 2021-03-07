#Your task is to write a CircularQueue class that implements a circular queue 
#for arbitrary objects. The class should obtain the buffer size with an 
#argument provided to CircularQueue::new, and should provide the following 
#methods:

# enqueue to add an object to the queue
# dequeue to remove (and return) the oldest object in the queue. 
#It should return nil if the queue is empty.

#You may assume that none of the values stored in the queue are nil 
#(however, nil may be used to designate empty spots in the buffer).


## Option 1 -- Circle Buffer Algo##
# class CircularQueue
#   attr_accessor :read_index, :write_index, :buffer

#   def initialize(size)
#     @buffer = Array.new(size)
#     @read_index = 0
#     @write_index = 0
#   end

#   def enqueue(obj)
#     if full?
#       buffer[read_index] = obj
#       increment_read_index
#     else
#       buffer[write_index] = obj
#       increment_write_index
#     end
#   end

#   def dequeue
#     return nil if self.empty?
#     return_value = buffer[read_index]
#     buffer[read_index] = nil
#     increment_read_index
#     return_value
#   end

#   private

#   def full?
#     buffer.select(&:nil?).empty?
#   end

#   def increment_read_index
#     self.read_index += 1
#     self.read_index = read_index % buffer.size
#   end

#   def increment_write_index
#     self.write_index += 1
#     self.write_index = write_index % buffer.size
#   end

#   def empty?
#     buffer.all?(&:nil?)
#   end
# end

## Option 2 -- Only Array class methods##
require 'pry'

class CircularQueue
  attr_accessor :buffer
  def initialize(buffer_size)
    @buffer = Array.new(buffer_size)
  end

  def enqueue(obj)
    buffer.shift
    buffer.push(obj)
  end

  def dequeue
    value = nil
    buffer.each_with_index do |entry, index|
      next if entry.nil?
      value = entry
      buffer[index] = nil
      break if !!(value)
    end
    value
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil
queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil