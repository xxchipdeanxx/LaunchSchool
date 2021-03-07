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
          perform_method(input)
        end
    end
  end

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

  def validate_method(input)
    raise("Invalod token: #{input}") unless self.methods.any? {|method| method == input}
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
    p register
  end
end

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

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
