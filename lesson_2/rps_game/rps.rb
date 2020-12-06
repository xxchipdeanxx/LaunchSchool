require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

# GAME VARIABLES
AVAILABLE_CHOICES = %i(rock paper scissors lizard spock)
ALTERNATE_CHOICES = %w(r p x l s)

ENTRY_TABLE = {
  rock: "\e[32mRock",
  paper: "\e[33mPaper",
  scissors: "\e[34mScissors",
  lizard: "\e[31mLizard",
  spock: "\e[36mSpock"
}

WINNING_MOVES = {
  rock: %i(lizard scissors),
  paper: %i(spock rock),
  scissors: %i(paper lizard),
  lizard: %i(spock paper),
  spock: %i(rock scissors)
}

user_score = 0
cpu_score = 0
match_number = 1

# STYLE
def input_prompt
  print "\e[1m\e[5m\e[36m\e -->\e[0m "
  gets.chomp.downcase
end

def print_output(message)
  puts "\e[1m\e[35m #{MESSAGES[message]}"
end

def clear_screen
  system('clear') || system('cls')
end

def tab_pad(num)
  "\t" * num
end

def disaplay_selections(user_selection, cpu_selection)
  clear_screen
  you_sel_str = "\e[1m\e[32mYou \e[35m selected:" # Reduce line length
  cpu_sel_str = "\e[1m\e[31mCPU \e[35m selected:" # Reduce line length
  puts "#{tab_pad(4)}#{you_sel_str} #{ENTRY_TABLE[user_selection]}"
  puts "#{tab_pad(4)}#{cpu_sel_str} #{ENTRY_TABLE[cpu_selection]}"
end

def display_score(match_number, user_score, cpu_score)
  puts "#{tab_pad(8)}\e[1m\e[32m MATCH NUMBER: \e[1m\e[32m #{match_number}"
  puts "#{tab_pad(8)}\e[1m\e[32m YOUR SCORE: \e[1m\e[32m #{user_score}"
  puts "#{tab_pad(8)}\e[1m\e[32m COMPUTER SCORE: \e[1m\e[32m #{cpu_score}"
  puts "\n"
end

def display_rules
  clear_screen
  print_output('rules')
  prompt_press_enter
end

# INPUT VALIDATION
def prompt_press_enter
  loop do
    print_output('press_ent')
    break if input_prompt == ""
  end
  clear_screen
end

def yes_or_no?
  bool = nil
  loop do
    usr_selection = input_prompt
    if %w(y yes).include?(usr_selection)
      bool = true
      break
    elsif %w(n no).include?(usr_selection)
      bool = false
      break
    else
      system("echo '\a'")
      print_output('input_error')
    end
  end
  bool
end

# GAME METHODS
def win?(usr_choice, cpu_choice)
  WINNING_MOVES[usr_choice].include?(cpu_choice)
end

def get_selection
  usr_selection = nil
  loop do
    usr_selection = input_prompt
    if AVAILABLE_CHOICES.include?(usr_selection.to_sym)
      return usr_selection.to_sym
    elsif ALTERNATE_CHOICES.include?(usr_selection)
      return usr_selection
    else
      system("echo '\a'")
      print_output('input_error')
    end
  end
end

def format_usr_selection(user_selection)
  if user_selection == 'r'
    :rock
  elsif user_selection == 'p'
    :paper
  elsif user_selection == 'x'
    :scissors
  elsif user_selection == 'l'
    :lizard
  else
    :spock
  end
end

# MAIN
clear_screen
print_output('welcome')
print_output('rules_prompt?')

display_rules if yes_or_no?

clear_screen

loop do
  display_score(match_number, user_score, cpu_score)
  print_output('please_select')
  user_selection = get_selection

  if user_selection.class == String
    user_selection = format_usr_selection(user_selection)
  end

  cpu_selection = AVAILABLE_CHOICES.sample

  disaplay_selections(user_selection, cpu_selection)

  if user_selection == cpu_selection
    print_output('tie')
  elsif win?(user_selection, cpu_selection)
    print_output('usr_won')
    user_score += 1
  else
    print_output('cpu_won')
    cpu_score += 1
  end

  display_score(match_number, user_score, cpu_score)

  prompt_press_enter
  break if (cpu_score == 5) || (user_score == 5)

  match_number += 1
end

# BYE BYE
if user_score == 5
  print_output('victory!')
else
  print_output('defeat')
end

print_output('bye')
