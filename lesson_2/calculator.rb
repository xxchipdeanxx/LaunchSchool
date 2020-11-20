puts 'Please enter a number:'
num1 = gets.chomp
puts 'Please enter another number:'
num2 = gets.chomp

puts 'Which operation would you like to perform?
      (add,subtract,multiply,divide):'
usr_answr = gets.chomp.downcase

case usr_answr
when 'add'
  puts "#{num1.to_i + num2.to_i}"
when 'subtract'
  puts "#{num1.to_i - num2.to_i}"
when 'multiply'
  puts "#{num1.to_i * num2.to_i}"
when 'divide'
  puts "#{num1.to_f / num2.to_f}"
end
