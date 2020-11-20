def prompt(text)
  puts "=> #{text}"
end

def valid_num?(number)
  number.to_i != 0
end

def operator_format_str(choice) #output formatting method. purly for looks
  case choice
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

name = nil
prompt('Welcome to our calculator! Enter your name:')
loop do
  name = gets.chomp
  if name.empty?
    prompt('Please enter a valid name')
  else
    break 
  end
end

prompt("Welcome #{name}")

loop do # main loop of the program
	num1 = nil
	loop do # get/validate first number
		prompt('Please enter a number:')
		num1 = gets.chomp
		if valid_num?(num1)
			break
		else
			prompt('Something went wrong...')
		end
	end

	num2 = nil
	loop do # get/validate second number
		prompt('Please enter a second number:')
		num2 = gets.chomp
		if valid_num?(num2)
			break
		else
			prompt('Please enter a valid number')
		end
  end
  
  prompt("Okay! You've entered #{num1} and #{num2}")

  operator_prompt = <<-MSG
  Please select an operation:
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt(operator_prompt)

  choice = nil
  loop do #user selects operation to perform w/ validation
    choice = gets.chomp
    break if %w(1 2 3 4).include?(choice)
  end

prompt("#{operator_format_str(choice)} your answer...")

	result = case choice
					 when '1'
						num1.to_i + num2.to_i
					 when '2'
						num1.to_i - num2.to_i
					 when '3'
						num1.to_i * num2.to_i
					 when '4'
						num1.to_f / num2.to_f
					 end

	puts result

	prompt('Would you like to run again? (enter Y to recalculate)')
	answer = gets.chomp.downcase
	break unless answer.start_with?('y')
end

prompt("Thanks #{name} for using our calculator!")

