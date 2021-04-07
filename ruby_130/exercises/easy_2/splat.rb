require 'set'

def my_method(arg1, *args)
  p arg1
  p "#{args} via splat: #{args.object_id}"
end

class MyClass
  def to_a
    result = Hash.new
    p result.object_id
    result
  end
end

me = MyClass.new

array = [1,2,3,4]
string = 'test'
hsh = {:a => 1, :b => 2, :c => 3}
my_method('arg1', *me)



