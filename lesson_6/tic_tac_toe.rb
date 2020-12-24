require 'pry'
require 'pry-byebug'

DEFAULT_MARK = " "
X = "\e[1m\e[31mX\e[0m"
O = "\e[1m\e[32mO\e[0m"

USER_PIECE = X
CPU_PIECE = O

WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                 [[1, 5, 9], [3, 5, 7]]

def tab_pad(num)
  "\t" * num
end

def new_line
  puts "\n"
end

def input_prompt
  print "\e[5m=>\e[0m"
  gets.chomp
end

def initilize_score
  { player: 0, cpu: 0 }
end

def get_input(acceptable_answers)
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

def display_score(score)
  puts "User(#{USER_PIECE}) Score: #{score[:player]}"
  puts "CPU(#{CPU_PIECE}) Score: #{score[:cpu]}"
  puts "      |      |      "
end

def display_board(brd, score)
  clear_screen
  display_score(score)
  puts "   #{brd[1]}  |   #{brd[2]}  |   #{brd[3]}   "
  puts "--------------------"
  puts "      |      |      "
  puts "   #{brd[4]}  |   #{brd[5]}  |   #{brd[6]}   "
  puts "--------------------"
  puts "   #{brd[7]}  |   #{brd[8]}  |   #{brd[9]}   "
  puts "      |      |      "
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
    trailing_element = array[-2, 2]
    array.slice!(-2, 2)
    array.join(separator) + " " + trailing_element.join(" ")
  else
    array[0]
  end
end

def empty_squares(brd_hsh)
  brd_hsh.keys.select { |num| brd_hsh[num] == DEFAULT_MARK }
end

def usr_select_square(brd_hsh)
  puts "Where would you like to place your piece?"
  puts "AVAILABLE SPACES: #{joinor(empty_squares(brd_hsh))}"
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

def cpu_select_square(brd_hsh)
  if detect_win(brd_hsh)
    cpu_choice = detect_win(brd_hsh)
  elsif assess_threat(brd_hsh)
    cpu_choice = assess_threat(brd_hsh)
  elsif empty_squares(brd_hsh).include?(5)
    cpu_choice = 5
  else
    cpu_choice = empty_squares(brd_hsh).sample
  end
  brd_hsh[cpu_choice] = CPU_PIECE
end

def board_full?(brd_hsh)
  empty_squares(brd_hsh).empty?
end

def detect_winner(brd_hsh)
  WINNING_COMBOS.each do |combo|
    if combo.select { |square| brd_hsh[square] == USER_PIECE }.size == 3
      return 'Player'
    elsif combo.select { |square| brd_hsh[square] == CPU_PIECE }.size == 3
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

def assess_threat(brd_hsh)
  player_squares = brd_hsh.select { |_, value| value == USER_PIECE }.keys
  block_location = nil
  WINNING_COMBOS.each do |combo|
    if combo.difference(player_squares).size == 1
      block_location = combo.difference(player_squares).first
      if empty_squares(brd_hsh).include?(block_location)
        break
      else
        block_location = nil
        next
      end
    end
  end
  block_location
end

def detect_win(brd_hsh)
  computer_squares = brd_hsh.select { |_, value| value == CPU_PIECE }.keys
  square_to_win = nil
  WINNING_COMBOS.select do |combo|
    if combo.difference(computer_squares).size == 1
      square_to_win = combo.difference(computer_squares).first
      if empty_squares(brd_hsh).include?(square_to_win)
        break
      else
        square_to_win = nil
        next
      end
    end
  end
  square_to_win
end

def set_play_order
  puts "#{tab_pad(2)}Who would you like to have the first move this round?"
  puts "#{tab_pad(4)}'Player' or 'Computer'?"
  new_line
  puts "You may enter things like: 'player', 'P', 'Computer', 'c'..."
  first_player = get_input(%w(player Player p P computer Computer c C))
  case first_player
  when 'player'
    FIRST_MOVE[:player]
  when 'p'
    FIRST_MOVE[:player]
  when 'computer'
    FIRST_MOVE[:computer]
  when 'c'
    FIRST_MOVE[:computer]
  end
end

def place_piece!(brd_hsh, current_player)
  case current_player
  when 'player'
    usr_select_square(brd_hsh)
  when 'computer'
    cpu_select_square(brd_hsh)
  end
end

def alternate_player(current_player)
  case current_player
  when 'player'
    'computer'
  when 'computer'
    'player'
  end
end

## MAIN ##
FIRST_MOVE = {
  choose: 'choose',
  player: 'player',
  computer: 'computer'
}

loop do
  clear_screen
  score_hsh = initilize_score

  puts "#{tab_pad(4)} Welcome to Tic Tac Toe:"
  puts "#{tab_pad(4)} The first to 5 wins!"
  new_line

  puts "#{tab_pad(4)} You will be: #{USER_PIECE}"
  puts "#{tab_pad(4)} The CPU will be: #{CPU_PIECE}"
  new_line

  puts "Press ENTER to continue:"
  get_input("")

  clear_screen
  first_player = FIRST_MOVE[:choose]
  first_player = set_play_order

  loop do
    board_hsh = initialize_board
    current_player = first_player

    loop do
      display_board(board_hsh, score_hsh)
      place_piece!(board_hsh, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board_hsh) || board_full?(board_hsh)
    end

    display_board(board_hsh, score_hsh)

    if someone_won?(board_hsh)
      puts "#{detect_winner(board_hsh)} won!"
    else
      puts "It's a tie!"
    end

    new_line
    puts "Press ENTER to continue:"
    get_input("")

    case detect_winner(board_hsh)
    when 'Player'
      score_hsh[:player] += 1
    when 'Computer'
      score_hsh[:cpu] += 1
    end
    break if score_hsh.values.include?(5)
  end

  clear_screen
  display_winner(score_hsh)

  puts "Would you like to play again?"
  new_line
  puts "'Y': yes; 'N': no"
  answer = get_input(%w(y Y n N))

  break if answer == 'n'
end

puts "exiting program..."
