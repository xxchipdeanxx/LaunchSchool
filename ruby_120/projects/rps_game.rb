require 'pry'

def clear_screen
  system('clear') || system('cls')
end

def new_line
  puts
end

def press_enter_to_cont
  input = nil
  loop do
    puts "PRESS ENTER TO CONTINUE..."
    input = gets.chomp
    break if input.empty?
    puts "Hm...something went wrong"
  end
end

class Player
  attr_accessor :move, :score

  def initialize
    @move = nil
    @score = nil
  end

  def establish_score(limit)
    @score = Score.new(limit)
  end
end

class Human < Player
  attr_reader :name

  def initialize
    @name = set_name
  end

  def set_name
    name = ""
    loop do
      puts "Please enter your name:"
      name = gets.chomp
      break unless name.empty?
      puts "Hm...something is missing"
    end
    name
  end

  def choose
    clear_screen
    selection = nil
    loop do
      puts "Please select #{Move::VALUES}"
      selection = gets.chomp
      break if Move::VALUES.include?(selection)
      puts 'Sorry, that is an invalid input'
      puts
    end
    @move = Move.new(selection)
  end
end

class Computer < Player
  attr_reader :name

  def initialize
    @name = %w(Cerebro C_3PO The_Red_Queen).sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# class Move
#   VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
#   WINNING_MOVES = {
#     'rock' => ['scissors', 'lizard'],
#     'paper' => ['rock', 'spock'],
#     'scissors' => ['lizard', 'paper'],
#     'lizard' => ['spock', 'paper'],
#     'spock' => ['scissors', 'rock']
#   }

#   LOSING_MOVES = {
#     'rock' => ['spock', 'paper'],
#     'paper' => ['lizard', 'scissors'],
#     'scissors' => ['rock', 'spock'],
#     'lizard' => ['scissors', 'rock'],
#     'spock' => ['lizard', 'paper']
#   }
#   attr_reader :move

#   def initialize(choice)
#     @move = choice
#   end

#   def to_s
#     move
#   end

#   def rock?
#     @move == 'rock'
#   end

#   def paper?
#     @move == 'paper'
#   end

#   def scissors?
#     @move == 'scissors'
#   end

#   def lizard?
#     @move == 'lizard'
#   end

#   def spock?
#     @move == 'spock'
#   end

#   def >(other_move)
#     WINNING_MOVES[self.to_s].include?(other_move.to_s)
#   end

#   def <(other_move)
#     LOSING_MOVES[self.to_s].include?(other_move.to_s)
#   end
# end

class Rock
  def initialize
  end
end

class Paper
  def initialize
  end
end

class Scissors
  def initialize
  end
end

class Lizard
  def initialize
  end
end

class Spock
  def initialize
  end
end

class Score
  attr_accessor :limit
  attr_reader :score

  def initialize(score_limit)
    @score = 0
    @@limit = score_limit
  end

  def to_s
    score.to_s
  end

  def self.limit
    @@limit
  end

  def >(score_limit)
    @score > score_limit
  end

  def +(value)
    @score += value
  end

  def ==(score_limit)
    @score == score_limit
  end
end

class RPSGame
  attr_reader :player, :computer

  def initialize
    @player = Human.new
    @computer = Computer.new
    @players = [@player, @computer]
  end

  def display_welcome
    clear_screen
    puts "Welcome to Rock, Paper, Scissors!"
    select_round_numbers
    puts
  end

  def display_goodbye
    puts "Bye bye!"
  end

  def display_moves
    clear_screen
    puts "Your move: #{player.move}"
    puts "Computer move: #{computer.move}"
  end

  def print_winner(winning_player)
    puts "#{winning_player.name} wins!"
    winning_player.score + 1
  end

  def display_winner
    if player.move > computer.move
      print_winner(player)
    elsif player.move < computer.move
      print_winner(computer)
    else
      puts "It's a tie"
    end
  end

  def display_final_winner
    puts "#{player.name} is the final winner" if player.score == Score.limit
    puts "#{computer.name} is the final winner" if computer.score == Score.limit
  end

  def display_running_tally
    display_moves
    display_winner
    puts "#{player.name} wins: #{player.score}/#{Score.limit}".center(80)
    puts "#{computer.name} wins: #{computer.score}/#{Score.limit}".center(80)
    press_enter_to_cont
  end

  def score_limit_reached?
    player.score == Score.limit || computer.score == Score.limit
  end

  def select_round_numbers
    puts 'How many rounds would you like to play?'
    limit = nil
    loop do
      limit = gets.chomp.to_i
      break if limit > 0
      puts 'Please enter a valid number greater than 0'
    end
    player.establish_score(limit)
    computer.establish_score(limit)
  end

  def play_again?
    choice = nil
    loop do
      new_line
      puts 'Would you like to play again?'
      puts 'Enter Y for Yes and N for No'
      choice = gets.chomp.downcase
      break if %w(y n).include?(choice)
      puts 'Sorry, you have entered the wrong input.'
    end
    choice == 'y'
  end

  def play
    loop do
      display_welcome
      until score_limit_reached?
        @players.each(&:choose)
        display_running_tally
      end
      display_final_winner
      break unless play_again?
    end
    display_goodbye
  end
end

RPSGame.new.play
