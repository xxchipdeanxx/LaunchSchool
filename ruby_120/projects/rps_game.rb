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
      puts "Please select #{Moves::TABLE.keys}"
      selection = gets.chomp.downcase
      break if Moves::TABLE.include?(selection)
      puts 'Sorry, that is an invalid input'
      new_line
    end
    choice = Moves::TABLE[selection]
    self.move = choice
    @history << choice
  end
end

class Computer < Player
  attr_reader :name

  def initialize
    super()
    @name = %w(Cerebro C_3PO The_Red_Queen).sample
  end

  def choose
    choice = Moves::TABLE.values.sample
    self.move = choice
    @history << choice
  end
end

module Moves
  class Move
    attr_accessor :move

    def to_s
      @move
    end

    def >(other_move)
      self.beats?(other_move)
    end

    def <(other_move)
      self.loses?(other_move)
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

  TABLE = {
    'rock' => Rock.new,
    'paper' => Paper.new,
    'scissors' => Scissors.new,
    'lizard' => Lizard.new,
    'spock' => Spock.new
  }
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
