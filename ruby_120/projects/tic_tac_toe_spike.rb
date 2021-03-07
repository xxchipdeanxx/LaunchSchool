#Game description:
  #each player is assigned a piece--either an X or an O. Each player takes
  #turns placing a piece on a space. The first player to fill 3 consecutive
  #spaces (horizontal, vertical, diagonal) wins the game

  #Nouns:
    #Player
    #Piece
    #Board
    #Space
    #Turn
    #Game

  #Verbs
    #select
    #mark
    #play

#Organize
  #Player
    #mark
    #play
  #Board
  #Square

class Player
  attr_accessor :piece
  def initialize(piece)
    @piece = piece
  end

  def place_piece(square_location)
    #place their piece at the desired square
  end
end

class Board
  attr_accessor :board
  def initialize
    @board = generate_new_board
  end

  def display
    puts "     |     |     "
    puts "     |     |     "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "     |     |     "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "     |     |     "
    puts "     |     |     "
  end
  private 

  def generate_new_board
    board = []
    9.times {|_| board << Square.new}
    board
  end
end

class Square
  attr_accessor :contents
  def initialize
    @contents = ""
  end

  # def self.=(piece)
  #   self.contents = piece
  # end

  def empty?
    contents == ""
  end
end

class TTTGame
  attr_accessor :board
  def initialize
    @board = Board.new
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ''
  end

  def dispay_goodbye_message
    puts "Thanks for playing Tic Tac Toe!"
    puts "Goodbye!"
  end
  
  def play
    display_welcome_message
    loop do
      board.display
      break
      player1.select
      break if board.full? || someone_won?

      player2.select
      break if board.full? || someone_won?
    end
    # display_winner
    dispay_goodbye_message
  end
end

game = TTTGame.new
game.play