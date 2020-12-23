# Create a very simple version of tic tac toe in ruby.
# There will be two players: a user and a computer

#Input: a character 'X' or 'O'
#Output: a board populated with previous selections

## REFACTORING ##
  #COMPUTER DEFENE#

## CPU DEFENCE ##
  # The computer should look to block a square if the two other
  # square in the WINNING_MOVES set are occupied by the players
  # If there is no imediate threat--the pick at random

  # Two methods place_piece and assess_threat

  #ASSESS THREAT#
  #Input: board array
  # 1. 'look' at the board and determine if the player has two pieces
  #     places in a 'winning condition'
  # 2. If a 'threat' is sensed then the cpu should place a piece to block

  ## ALGO ##
  # 1. create constant WINNING_COMBOS array that contains all winning empty_squares
  # 2. Iterate through the board_hsh to see where player pieces are placed
  #   - iterate through board hash and extract all k/v that contain player piece
  #   - take all keys from player hsh and place them in an array player_squares
  #   - array represents all squares the opposing player has a piece set
  # 3. Compare where pieces are placed with all the winning conditions
  #   - iterate through the WINNING_COMBOS array, set-by-set
  #   - compare the square numbers from the combo to the players
  #     -if 
require 'pry'
require 'pry-byebug'

DEFAULT_MARK = " "
X = "\e[1m\e[31mX\e[0m"
O = "\e[1m\e[32mO\e[0m"

WINNING_COMBOS = [[1,2,3], [4,5,6], [7,8,9]] +
[[1,4,7], [2,5,8], [3,6,9]] +
[[1,5,9], [3,5,7]]


def input_prompt
  print "\e[5m=>\e[0m"
  gets.chomp
end

def initilize_score
  {player: 0, cpu: 0}
end

def get_input(acceptable_answers)
  puts "Please enter your answer:"
  user_input = nil
  loop do
    user_input = input_prompt
    break if acceptable_answers.include?(user_input)
    puts "Please enter a valid selection"
  end
  user_input.downcase
end

def clear_screen
  system('clear') || system('cls')
end

def select_piece
  puts "Would you like to be #{X} or #{O}?"
  usr_choice = nil
  loop do
    usr_choice = input_prompt
    break if %w(x o).include?(usr_choice.downcase)
    puts "Please select a valid piece"
  end
  usr_choice == 'x' ? X : O
end

def display_board(brd_hsh, score_hsh)
  clear_screen
  puts "User Score: #{score_hsh[:player]}"
  puts "CPU Score: #{score_hsh[:cpu]}"
  puts"      |      |      "
  puts"   #{brd_hsh[1]}  |   #{brd_hsh[2]}  |   #{brd_hsh[3]}   "
  puts"      |      |      "
  puts"--------------------"
  puts"      |      |      "
  puts"   #{brd_hsh[4]}  |   #{brd_hsh[5]}  |   #{brd_hsh[6]}   "
  puts"      |      |      "
  puts"--------------------"
  puts"      |      |      "
  puts"   #{brd_hsh[7]}  |   #{brd_hsh[8]}  |   #{brd_hsh[9]}   "
  puts"      |      |      "
end

def initialize_board
  board = {}
  (1..9).each do |num|
    board[num] = DEFAULT_MARK
  end
  board
end

def joinor(array, separator = ';', conj = 'or')
  if array.size > 1
    array.insert(-2, conj)
    trailing_element = array[-2,2]
    array.slice!(-2,2)
    array.join(separator) + " " + trailing_element.join(" ")
  else
    array[0]
  end
end

def empty_squares(brd_hsh)  #generates an array of available choices
  empty_squares = brd_hsh.keys.select {|num| brd_hsh[num] == DEFAULT_MARK}
end

def usr_select_square(brd_hsh)
  puts "Where would you like to place your piece? #{joinor(empty_squares(brd_hsh))}"
  loop do
    usr_choice = input_prompt
    if empty_squares(brd_hsh).include?(usr_choice.to_i)
      brd_hsh[usr_choice.to_i] = USER_PIECE
      break
    else
      puts "You have entered an invalid option."
      puts "Please try again"
    end
  end
end

def cpu_select(brd_hsh) #ZERO logic at the moment. All randomized
  if detect_threat?(brd_hsh)
    square_to_block = assess_threat(brd_hsh)
    if brd_hsh[square_to_block] == CPU_PIECE
      cpu_select = empty_squares(brd_hsh).sample
      brd_hsh[cpu_select] = CPU_PIECE
    else
      brd_hsh[square_to_block] = CPU_PIECE
    end
  else
    cpu_select = empty_squares(brd_hsh).sample
    brd_hsh[cpu_select] = CPU_PIECE
  end
end

def board_full?(brd_hsh)
  empty_squares(brd_hsh).empty?
end

def detect_winner(brd_hsh)
  winning_moves = [[1,2,3], [4,5,6], [7,8,9]] +
                  [[1,4,7], [2,5,8], [3,6,9]] +
                  [[1,5,9], [3,5,7]]

  winning_moves.each do |line|
    if brd_hsh[line[0]] == USER_PIECE &&
       brd_hsh[line[1]] == USER_PIECE &&
       brd_hsh[line[2]] == USER_PIECE
       return 'Player'
    elsif brd_hsh[line[0]] == CPU_PIECE &&
      brd_hsh[line[1]] == CPU_PIECE &&
      brd_hsh[line[2]] == CPU_PIECE
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd_hsh)
  !!detect_winner(brd_hsh)
end

def display_winner(score_hsh)
  case score_hsh.key(5).to_s
  when 'player'
    puts "Congradulations! You won!"
  when 'cpu'
    puts "The computer won. Better luck next time"
  end
end

def detect_threat?(brd_hsh)
  player_squares = brd_hsh.select {|_, value| value == USER_PIECE}.keys
  threat = WINNING_COMBOS.select do |combo|
    combo.difference(player_squares).size == 1
  end
  !!threat[0]
end

def assess_threat(brd_hsh)
  player_squares = brd_hsh.select {|_, value| value == USER_PIECE}.keys
  block_location = nil
  WINNING_COMBOS.each do |combo|
    if combo.difference(player_squares).size == 1
      block_location = combo.difference(player_squares)
      if (brd_hsh[block_location[0]] == CPU_PIECE)
        next
      else
        break
      end
    end
  end
  block_location[0]
end


## MAIN ##
USER_PIECE = select_piece
CPU_PIECE  = (USER_PIECE == X ? O : X)

loop do
  clear_screen
  score_hsh = initilize_score

  loop do
    board_hsh = initialize_board
    # binding.pry
    loop do
      display_board(board_hsh, score_hsh)
      usr_select_square(board_hsh)
      display_board(board_hsh, score_hsh)
      break if someone_won?(board_hsh) || board_full?(board_hsh)
      cpu_select(board_hsh)
      display_board(board_hsh, score_hsh)
      break if someone_won?(board_hsh) || board_full?(board_hsh)
    end

    display_board(board_hsh, score_hsh)

    if someone_won?(board_hsh)
      puts "#{detect_winner(board_hsh)} won!"
    else
      puts "It's a tie!"
    end

    case detect_winner(board_hsh)
    when 'Player'
      score_hsh[:player] += 1
    when 'Computer'
      score_hsh[:cpu] += 1
    end
    break if score_hsh.values.include?(5)
  end
  display_winner(score_hsh)
  puts "Would you like to play again?"
  puts "'Y': yes; 'N': no"
  answer = get_input(%w(y Y n N))

  break if answer == 'n'
end

puts "exiting program..."