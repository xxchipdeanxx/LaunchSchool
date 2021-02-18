require 'pry'

module TerminalControl
  def clear
    system('clear') || system('cls')
  end

  def new_line
    puts ""
  end
end

class Player
  attr_accessor :marker, :name

  def to_s
    name
  end
end

class Human < Player
  def initialize
    @name = get_name
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

  def get_name
    puts "Please enter your name"
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts 'Hmm...something is missing'
    end
    self.name = name
  end

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

class Computer < Human
  def initialize(other_marker)
    @name = 'Computer'
    @marker = other_marker == "X" ? "O" : "X"
  end

  def place_marker(board)
    random_square = board.available_squares.sample
    board[random_square].contents = marker
  end
end

class Board
  include TerminalControl
  WINNING_LIINES = [[1,2,3],[4,5,6],[7,8,9]] + #horizontal 
                    [[1,4,7],[2,5,8],[3,6,9]] + #vertical
                    [[1,5,9], [7,5,3]] #diagonal
  attr_accessor :board
  def initialize
    @board = generate_new_board
  end

  def [](square_num)
    board[square_num]
  end

  def full?
    !(board.values.any? {|square| square.empty?})
  end

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

  def available_squares
    board.select {|key, square| square.empty?}.keys
  end

  def someone_won?
    !!(winning_marker)
  end

  def winning_marker
    WINNING_LIINES.any? do |line|
      if board.values_at(*line).all? {|square| square.contents == 'X'}
        return 'X'
      elsif board.values_at(*line).all? {|square| square.contents == 'O'}
        return 'O'
      end
    end
    nil
  end

  private

  def generate_new_board
    (1..9).each_with_object({}) {|space_num, hsh| hsh[space_num] = Square.new}
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

class TTTGame
  include TerminalControl
  attr_accessor :board, :player, :computer
  def initialize
    @player = Human.new
    @computer = Computer.new(player.marker)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ''
  end

  def dispay_goodbye_message
    puts "Thanks for playing Tic Tac Toe!"
    puts "Goodbye!"
  end

  def display_winner
    if player.marker == board.winning_marker
      puts "#{player} won!"
    elsif computer.marker == board.winning_marker
      puts "#{computer} won"
    else
      puts "It's a tie"
    end      
  end
  
  def play
    display_welcome_message
    loop do
      initialize_board
      loop do
        player.place_marker(board)
        break if board.full? || board.someone_won?

        computer.place_marker(board)
        break if board.full? || board.someone_won?
      end

      board.display
      display_winner
      break unless play_again?
    end
    dispay_goodbye_message
  end

  private

  # def main_game
  #   player.place_marker(board)
  #   break if board.full? || board.someone_won?

  #   computer.place_marker(board)
  #   break if board.full? || board.someone_won?
  # end

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
end

game = TTTGame.new
game.play
