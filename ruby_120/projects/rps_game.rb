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
  attr_accessor :move, :score, :history

  def initialize
    @move = nil
    @score = nil
    @history = []
  end

  def establish_score(limit)
    @score = Score.new(limit)
  end

  def display_history
    @history.each_with_index do |move, index|
      puts "Choice ##{index + 1}: #{move}"
    end
  end
end

class Human < Player
  attr_reader :name

  def initialize
    super()
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
      puts "Please select #{Move::CHOICES}"
      selection = gets.chomp.downcase
      break if Move::CHOICES.include?(selection)
      puts 'Sorry, that is an invalid input' + "\n"
    end
    self.move = Move.convert_to_class(selection)
    @history << selection
  end
end

class Computer < Player
  attr_reader :name

  def initialize
    super()
  end

  def choose
    selection = Move::CHOICES.sample
    @move = Move.convert_to_class(selection)
    @history << selection
  end
end

class Cerebro < Computer
  def initialize
    super()
    @name = 'Cerebro'
  end
end

class TheRedQueen < Computer
  def initialize
    super()
    @name = 'The Red Queen'
  end
end

class C3PO < Computer
  def initialize
    super()
    @name = "C-3PO"
  end
end

class Move
  CHOICES = %w(rock paper scissors lizard spock)
  attr_accessor :move

  def to_s
    @move
  end

  private
  def self.convert_to_class(selection)
    return Rock.new if selection == 'rock'
    return Paper.new if selection == 'paper'
    return Scissors.new if selection == 'scissors'
    return Lizard.new if selection == 'lizard'
    return Spock.new if selection == 'spock'
  end
end

class Rock < Move
  def initialize
    @move = 'rock'
  end
  
  def beats?(other_move)
    %w(lizard scissors).include?(other_move.to_s)
  end

  def loses?(other_move)
    %w(spock paper).include?(other_move.to_s)
  end
end

class Paper < Move
  def initialize
    @move = 'paper'
  end

  def beats?(other_move)
    %w(spock rock).include?(other_move.to_s)
  end

  def loses?(other_move)
    %w(lizard scissors).include?(other_move.to_s)
  end
end

class Scissors < Move
  def initialize
    @move = 'scissors'
  end

  def beats?(other_move)
    %w(lizard paper).include?(other_move.to_s)
  end

  def loses?(other_move)
    %w(spock rock).include?(other_move.to_s)
  end
end

class Lizard < Move
  def initialize
    @move = 'lizard'
  end

  def beats?(other_move)
    %w(spock paper).include?(other_move.to_s)
  end

  def loses?(other_move)
    %w(scissors rock).include?(other_move.to_s)
  end
end

class Spock < Move
  def initialize
    @move = 'spock'
  end

  def beats?(other_move)
    %w(rock scissors).include?(other_move.to_s)
  end

  def loses?(other_move)
    %w(lizard paper).include?(other_move.to_s)
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
    @computer = [Cerebro, TheRedQueen, C3PO].sample.new
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
    puts "#{computer.name}'s move: #{computer.move}"
  end

  def print_winner(winning_player)
    puts "#{winning_player.name} wins!"
    winning_player.score + 1
  end

  def display_winner
    if player.move.beats?(computer.move)
      print_winner(player)
    elsif player.move.loses?(computer.move)
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
