require 'pry'

module TerminalControl
  def clear
    system('clear') || system('cls')
  end

  def new_line
    puts ""
  end

  def press_enter
    puts 'Press ENTER to continue:'
    loop do
      input = gets.chomp
      break if input.empty?
      puts 'Hm...something went wrong'
    end
  end
end

class Player
  attr_accessor :marker, :name, :wins

  def initialize
    @name = set_name
    @wins = Score.new
  end

  def to_s
    name
  end

  private

  def set_name
    puts "Please enter #{self.class} name"
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts 'Hmm...something is missing'
    end
    self.name = name
  end
end

class Human < Player
  def initialize
    super()
    @marker = select_marker
  end

  def place_marker(board)
    board.display
    puts "Please select a square: #{board.available_squares}"
    selection = nil
    loop do
      selection = gets.chomp.to_i
      break if board.available_squares.include?(selection)
      puts 'Whoops! Please select an available square'
    end
    board[selection].contents = marker
  end

  private

  def select_marker
    puts "Please select your marker: X or O"
    marker = nil
    loop do
      marker = gets.chomp
      break if %w(x X o O).include?(marker)
      puts 'Please select either X or O'
    end
    self.marker = marker.upcase
  end
end

class Computer < Player
  def initialize(other_marker)
    super()
    @marker = other_marker == "X" ? "O" : "X"
  end

  def place_marker(board)
    random_square = board.available_squares.sample
    board[random_square].contents = marker
  end
end

class Board
  include TerminalControl
  WINNING_LIINES =  [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # horizontal
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # vertical
                    [[1, 5, 9], [7, 5, 3]] # diagonal
  attr_accessor :board

  def initialize
    @board = generate_new_board
  end

  def [](square_num)
    board[square_num]
  end

  def full?
    !(board.values.any?(&:empty?))
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def display
    clear
    puts "     |     |     "
    puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def available_squares
    board.select { |_, square| square.empty? }.keys
  end

  def someone_won?
    !!(winning_marker)
  end

  def winning_marker
    WINNING_LIINES.any? do |line|
      return 'X' if board.values_at(*line).all? { |squ| squ.contents == 'X' }
      return 'O' if board.values_at(*line).all? { |squ| squ.contents == 'O' }
    end
    nil
  end

  private

  def generate_new_board
    (1..9).each_with_object({}) { |space_num, hsh| hsh[space_num] = Square.new }
  end
end

class Square
  attr_accessor :contents

  def initialize
    @contents = " "
  end

  def to_s
    contents
  end

  def empty?
    contents == " "
  end

  def ==(marker)
    contents == marker
  end
end

class Score
  attr_accessor :score

  def initialize
    @score = 0
    @@limit = nil
  end

  def self.limit
    @@limit
  end

  def self.set_limit
    puts "How many rounds are needed to win? Max rounds: 10"
    rounds = nil
    loop do
      rounds = gets.chomp.to_i
      break if (1..10).include?(rounds)
      puts "Please enter a number between 1 and 10"
    end
    @@limit = rounds
  end

  def increment
    self.score += 1
  end

  def ==(score_limit)
    score == score_limit
  end
end

class TTTGame
  include TerminalControl
  attr_accessor :board, :player, :computer, :current_marker

  def initialize
    @player = Human.new
    @computer = Computer.new(player.marker)
    @current_marker = nil
  end

  def play
    loop do
      display_welcome_message
      reset_scores
      Score.set_limit
      main_game
      display_final_winner
      break unless play_again?
    end
    dispay_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ''
  end

  def dispay_goodbye_message
    puts "Thanks for playing Tic Tac Toe!"
    puts "Goodbye!"
  end

  def display_winner
    board.display
    if player.marker == board.winning_marker
      winner(player)
    elsif computer.marker == board.winning_marker
      winner(computer)
    else
      puts "It's a tie"
    end
    press_enter
  end

  def main_game
    loop do
      reset
      player_moves
      display_winner
      break if score_limit_reached?
    end
  end

  def player_moves
    loop do
      current_player_moves
      break if board.full? || board.someone_won?
    end
  end

  def current_player_moves
    if human_turn?
      player.place_marker(board)
      self.current_marker = computer.marker
    else
      computer.place_marker(board)
      self.current_marker = player.marker
    end
  end

  def human_turn?
    current_marker == player.marker
  end

  def initialize_board
    @board = Board.new
  end

  def play_again?
    puts "Would you like to play again?"
    puts "Enter 'Y' for Yes and 'N' for No"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %(yes no y n).include?(answer)
      puts 'Please enter a valid input'
    end
    %(yes y).include?(answer)
  end

  def reset
    initialize_board
    self.current_marker = set_first_move
  end

  def score_limit_reached?
    player.wins == Score.limit || computer.wins == Score.limit
  end

  def display_final_winner
    if player.wins == Score.limit
      puts "#{player} won the game"
    else
      "#{computer} won the game"
    end
  end

  def winner(player)
    player.wins.increment
    puts "#{player} won!"
  end

  def set_first_move
    puts "Who should have the first move?: Player or Computer"
    puts "Enter 'P' for Player and 'C' for Computer"
    first_move = nil
    loop do
      first_move = gets.chomp.downcase
      break if %w(p c).include?(first_move)
      puts "Please enter either 'P' or 'C'."
    end
    first_move == 'p' ? player.marker : computer.marker
  end

  def reset_scores
    player.wins.score = 0
    computer.wins.score = 0
  end
end

game = TTTGame.new
game.play
