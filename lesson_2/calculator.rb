require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message)
  MESSAGES[LANG][message]
end

def prompt(text) # Helps program prompts stand out.
  puts "=> #{text}"
end

def integer?(number)
  Integer(number, exception: false)
end

def float?(number)
  Float(number, exception: false)
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
    puts MESSAGES[key]['language']
  end

  lang_select = nil
  loop do
    lang_select = gets.chomp.downcase
    break if MESSAGES.keys.include?(lang_select)
    prompt('Please select a valid language.')
    prompt('Seleccione un idioma válido')
  end
  lang_select
end

LANG = select_lang

# MAIN FUNCTION
prompt(messages('welcome_intro'))
name = nil
loop do
  name = gets.chomp
  if name.empty?
    prompt(messages('name_error'))
  else
    break
  end
end

prompt("#{messages('welcome')} #{name}")

loop do # main loop of the program
  num1 = nil
  loop do # get/validate first number
    prompt(messages('enter_num1'))
    num1 = gets.chomp
    if integer?(num1) || float?(num1)
      break
    else
      prompt(messages('num_error'))
    end
  end

  num2 = nil
  loop do # get/validate second number
    prompt(messages('enter_num2'))
    num2 = gets.chomp
    if integer?(num2) || float?(num2)
      break
    else
      prompt(messages('num_error'))
    end
  end

  prompt("#{messages('okay')} #{num1} #{messages('and')} #{num2}")

  prompt(messages('operator_prompt'))
  prompt(messages('add'))
  prompt(messages('subtract'))
  prompt(messages('multiply'))
  prompt(messages('divide'))

  choice = nil
  loop do # user selects operation to perform w/ validation
    choice = gets.chomp
    break if %w(1 2 3 4).include?(choice)
  end

  operator_format_str(choice)

  result =  case choice
            when '1'
              if float?(num1) || float?(num2)
                num1.to_f + num2.to_f
              else
                num1.to_i + num2.to_i
              end
            when '2'
              if float?(num1) || float?(num2)
                num1.to_f - num2.to_f
              else
                num1.to_i - num2.to_i
              end
            when '3'
              if float?(num1) || float?(num2)
                num1.to_f * num2.to_f
              else
                num1.to_i * num2.to_i
              end
            when '4'
              if num2.to_f != 0
                num1.to_f / num2.to_f
              else
                prompt(messages('division_error'))
                messages('calc_error')
              end
            end

  prompt("#{messages('answer?')} #{result}")

  prompt(messages('again?'))
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("#{messages('thanks')} #{name} #{messages('using_calc')}")
