require 'pry'

class Minilang
  attr_accessor :stack, :register, :command_stream
  def initialize(command_string)
    @stack = []
    @register = 0
    @command_stream = format_stream(command_string.split)
  end

  def eval
    command_stream.each do |input|
        if input.class == Integer
          to_register(input) 
          next
        else
          raise ('Invalid Token') unless valid_method?(input)
          self.send input if valid_method?(input)
        end
    end
  end

  private
  def format_stream(command_string)
    command_string.each_with_object([]) do |entry, object|
      if /[[:digit:]]/.match(entry)
        object << entry.to_i
      else
        object << entry.downcase.to_sym
      end
    end
  end

  def perform_method(input)
    begin
      validate_method(input)
      self.send input
    rescue => e
      puts e.message
      exit 1
    end
  end

  def valid_method?(input)
    self.methods.any? {|method| method == input}
  end

  def to_register(num)
    self.register = num
  end

  def push
    stack << register
  end

  def add
    self.register += stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def pop
    raise('Empty stack!') if stack.empty?
    self.register = stack.pop
  end

  def print
    puts register
  end
end

binding.pry
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

# Minilang.new('POP').eval


#The issue is that, because all of our methods are private: they
# are not reported back one line 43 when #methods is called
# methods will only produce the PUBLIC instance methods
  #send can only

#Because all of our methods are 'private', when we call #methods in order
# check for the exisence of a class method --> none of our operaiton methods
# are included in the return.

#Because of this #valid_method? will never return as true in its current form

#Solution
#remove our private keyword
