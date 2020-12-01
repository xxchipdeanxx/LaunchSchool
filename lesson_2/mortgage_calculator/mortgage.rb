require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

# STYLE
def output(message)
  puts "\e[1m\e[34m#{MESSAGES[message]}\e[0m"
end

def input_prompt
  print "\e[1m\e[5m\e[94m --> \e[0m"
  gets.chomp
end

# INPUT VALIDATION
def valid_price?(string)
  /\d/.match(string) && /^\${1}\d*,*\d*\.?\d+$/.match(string)
end

def valid_rate?(string)
  /^\d?\.?\d+%?$/.match(string)
end

def valid_num?(number)
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

# INPUT FORAMTTING
def format_price(string)
  price_ary = string.split("").select do |element|
    /\d/.match(element) || /\./.match(element)
  end
  price_str = price_ary.join
  if price_str.include? "."
    price_str.to_f
  else
    price_str.to_i
  end
end

def format_float(down_payment_string, house_price = nil)
  if /^\.{1}\d+%?$/.match(down_payment_string)
    down_payment_string.to_f
  elsif /^\d+\.?\d*%?$/.match(down_payment_string)
    down_payment_string.to_f / 100
  else
    p calc_percent(down_payment_string, house_price)
  end
end

# GET INPUT
def get_year
  output('years?')
  years = nil
  loop do
    years = input_prompt
    break if valid_num?(years) && years != '0'
    output('error_num')
  end
  years.to_f
end

def get_price
  price = nil
  loop do
    price = input_prompt
    break if valid_price?(price)
    output('error_price')
  end
  price
end

def get_rate
  rate_str = nil
  loop do
    rate_str = input_prompt
    break if valid_rate?(rate_str) || valid_price?(rate_str)
    output('error_rate')
  end
  rate_str
end

def get_select(num)
  choice = nil
  loop do
    choice = input_prompt
    break if choice.to_i <= num
    output('error_choice')
  end
  choice
end

# METHODS
def clear_screen
  system('clear') || system('cls')
end

def custom_down(house_price)
  output('amount')
  rate_str = get_rate
  format_float(rate_str, house_price)
end

def calc_percent(amount_down, house_price)
  format_price(amount_down) / house_price.to_f
end

def calc_payment(loan_amount, years, monthly_interest)
  if monthly_interest == 0.0
    loan_amount / years
  else
    loan_amount * (monthly_interest / (1 -
      (1 + monthly_interest)**(-1 * years)))
  end
end

def exit?
  output('again?')
  bool = nil
  loop do
    answer = input_prompt.downcase
    if %w(y yes).include?(answer)
      bool = true
      break
    elsif %w(no n).include?(answer)
      bool = false
      break
    else
      output('error_choice')
    end
  end
  bool
end

def exit_program
  output('troll')
  output('exit')
  exit
end

def set_down(house_price)
  case get_select(4)
  when '1'
    0.05
  when '2'
    0.10
  when '3'
    0.20
  when '4'
    custom_down(house_price)
  end
end

def set_duration
  case get_select(4)
  when '1'
    15 * 12
  when '2'
    30 * 12
  when '3'
    40 * 12
  when '4'
    get_year * 12
  end
end

def total_loan(loan_amount, years, monthly_interest)
  if monthly_interest == 0.0
    loan_amount
  else
    (monthly_interest * loan_amount * years) / (1 -
      ((1 + monthly_interest)**(-1 * years)))
  end
end

# MAIN
output('welcome')
output('begin')
loop do
  output('home_price?')
  house_price = format_price(get_price)
  exit_program if house_price == 0
  output('excellent')

  output('down_price?')
  output('down_opts')
  down_payment_percent = set_down(house_price)
  output('excellent')

  loan_amount = house_price - (house_price * down_payment_percent)

  output('APR?')
  annual_percent_apr = format_float(get_rate)
  monthly_interest = annual_percent_apr / 12.0
  output('excellent')

  output('duration?')
  output('duration_opts')
  years = set_duration
  output('excellent')
  clear_screen

  output('breakdown')
  output('monthly_payment')
  puts calc_payment(loan_amount, years, monthly_interest).round(2)
  output('total_loan')
  puts total_loan(loan_amount, years, monthly_interest).round(2)
  output('num_payments')
  puts years
  output('total_interest')
  puts (total_loan(loan_amount, years, monthly_interest) - loan_amount).round(2)

  break unless exit?
  output('okay')
  clear_screen
end
output('thanks')
