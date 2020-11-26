require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message)
  MESSAGES[LANG][message]
end

def prompt(text) # Helps program prompts stand out.
  puts "=> #{text}"
end

def valid_num?(number)
  /\d/.match(number) && /^-?\d*\.?\d*$/.match(number)
end

def float?(number)
  /\d/.match(number) && /^-?\d*\.\d*$/.match(number)
end

def operator_format_str(choice) # output formatting method.
  case choice
  when '1'
    prompt(messages('adding'))
  when '2'
    prompt(messages('subtracting'))
  when '3'
    prompt(messages('multiplying'))
  when '4'
    prompt(messages('dividing'))
  end
end

def select_lang
  lang_ary = MESSAGES.keys.sort
  prompt('Please select a language:')
  prompt('Por favor seleccione un idioma')
  lang_ary.each do |key|
    puts "#{key} = #{MESSAGES[key]['language']}"
  end

  lang_select = nil
  loop do
    print "-->"
    lang_select = gets.chomp.downcase
    break if MESSAGES.keys.include?(lang_select)
    prompt('Please select a valid language.')
    prompt('Seleccione un idioma válido')
  end
  lang_select
end

LANG = select_lang

def get_name
  name = nil
  loop do
    print '-->'
    name = gets.chomp
    if name.empty? || name[0] == " "
      prompt(messages('name_error'))
    else
      break
    end
  end
  name
end

def get_num
  num = nil
  loop do # get/validate first number
    print "-->"
    num = gets.chomp
    if valid_num?(num)
      break
    else
      prompt(messages('num_error'))
    end
  end
  num
end

def get_operator
  choice = nil
  loop do # user selects operation to perform w/ validation
    print '-->'
    choice = gets.chomp
    break if %w(1 2 3 4).include?(choice)
  end
  choice
end

def convert_num(num1, num2)
  if float?(num1) || float?(num2)
    [num1.to_f, num2.to_f]
  else
    [num1.to_i, num2.to_i]
  end
end

def calculate(num1, num2, choice)
  (num1, num2) = convert_num(num1, num2)
  case choice
  when '1'
    num1 + num2
  when '2'
    num1 - num2
  when '3'
    num1 * num2
  when '4'
    if division_error?(num2)
      num1 % num2
    else
      messages('calc_error')
    end
  end
end

def division_error?(num2)
  if num2 == 0
    prompt(messages('division_error'))
    false
  else
    true
  end
end

# MAIN FUNCTION
prompt(messages('welcome_intro'))
NAME = get_name

prompt("#{messages('welcome')} #{NAME}")

loop do # main loop of the program
  prompt(messages('enter_num1'))
  num1 = get_num
  prompt(messages('enter_num2'))
  num2 = get_num

  prompt("#{messages('okay')} #{num1} #{messages('and')} #{num2}")

  prompt(messages('operator_prompt'))
  prompt(messages('add'))
  prompt(messages('subtract'))
  prompt(messages('multiply'))
  prompt(messages('divide'))

  choice = get_operator

  operator_format_str(choice)

  result = calculate(num1, num2, choice)

  prompt("#{messages('answer?')} #{result}")

  prompt(messages('again?'))
  print "-->"
  answer = gets.chomp.downcase
  break unless %w(yes y).include?(answer)
end

prompt("#{messages('thanks')} #{NAME} #{messages('using_calc')}")
