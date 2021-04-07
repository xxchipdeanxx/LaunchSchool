my_proc = Proc.new do |thing|
  puts "I am a #{thing}."
  return self
end

my_lambda = lambda do |thing|
  puts "I am a #{thing}"
  return self
end

def my_method
  yield('cat')
  puts 'Execution has returned to the method'
end

# puts 'simple Proc call:'.center(80)
# p my_method(&my_proc)
# puts "\n"
puts 'lambda call:'.center(80)
p my_method(&my_lambda)