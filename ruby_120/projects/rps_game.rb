module TerminalControl
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
end

class Player
  include TerminalControl
  attr_accessor :move, :score, :history, :name

  def initialize
    @name = nil
    @score = nil
    @name = nil
    @history = []
  end

  def establish_score(limit)
    self.score = Score.new(limit)
  end

  def display_history
    @history.each_with_index do |move, index|
      puts "Choice ##{index + 1}: #{move}"
    end
  end

  private

  def assign_move(selection)
    self.move = Move.convert_to_class(selection)
    @history << move
  end
end

class Human < Player
  def initialize
    super()
    @name = set_name
  end

  def choose
    clear_screen
    selection = nil
    loop do
      puts "Please select #{Move.display_choices}"
      selection = gets.chomp.downcase
      break if Move::CHOICES.flatten.include?(selection)
      puts 'Sorry, that is an invalid input' + "\n"
    end
    selection = format(selection)
    assign_move(selection)
  end

  private

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

  def format(selection)
    Move::CHOICES[0].select { |word| word.include?(selection) }.join
  end
end

class Computer < Player
  attr_accessor :prev_round_won

  def initialize
    super()
    @prev_round_won = nil
  end
end

class Cerebro < Computer
  def initialize
    super()
    @name = 'Cerebro'
  end

  def choose
    # if first chioce --> select at random
    # if CPU won --> select a move that would beat previous, winning move
    # if CPU lost --> select one of the moves that beat it
    selection = if prev_round_won.nil?
                  Move::CHOICES[0].sample
                elsif prev_round_won?
                  move_that_beats(history.last)
                else
                  move_that_caused_loss(history.last)
                end
    assign_move(selection)
  end

  private

  def prev_round_won?
    prev_round_won == true
  end

  def move_that_beats(previous_move)
    previous_move.beats.sample.to_s.downcase
  end

  def move_that_caused_loss(previous_move)
    previous_move.loses.sample.to_s.downcase
  end
end

class TheRedQueen < Computer
  def initialize
    super()
    @name = 'The Red Queen'
  end

  def choose
    # win via deception
    declaration = Move::CHOICES[0].sample
    puts "#{name} says she is selecting #{declaration}"
    true_selection = select_opposite(declaration)
    assign_move(true_selection)
    press_enter_to_cont
  end

  private

  def select_opposite(declaration)
    false_move = Move.convert_to_class(declaration)
    anticipated_opponent_move = false_move.loses.sample.new
    anticipated_opponent_move.loses.sample.to_s.downcase
  end
end

class C3PO < Computer
  # random seleciton
  def initialize
    super()
    @name = "C-3PO"
  end

  def choose
    selection = Move::CHOICES[0].sample
    assign_move(selection)
  end
end

class Move
  # allows for both full and abbreviated user input
  CHOICES = [%w(rock paper scissors lizard spock), %w(ro pa sc li sp)]

  attr_accessor :name
  attr_reader :beats, :loses

  def to_s
    @name
  end

  def >(other_move)
    @beats.any? { |loser| other_move.class == loser }
  end

  def self.convert_to_class(selection)
    return Rock.new if selection == 'rock'
    return Paper.new if selection == 'paper'
    return Scissors.new if selection == 'scissors'
    return Lizard.new if selection == 'lizard'
    return Spock.new if selection == 'spock'
  end

  def self.display_choices
    CHOICES[0].map do |move|
      leading_chars = /^[[:lower:]]{2}/.match(move).to_s
      move.gsub(leading_chars, "(#{leading_chars})")
    end
  end
end

class Rock < Move
  def initialize
    @name = 'rock'
    @beats = [Lizard, Scissors]
    @loses = [Spock, Paper]
  end
end

class Paper < Move
  def initialize
    @name = 'paper'
    @beats = [Spock, Rock]
    @loses = [Lizard, Scissors]
  end
end

class Scissors < Move
  def initialize
    @name = 'scissors'
    @beats = [Lizard, Paper]
    @loses = [Rock, Spock]
  end
end

class Lizard < Move
  def initialize
    @name = 'lizard'
    @beats = [Spock, Paper]
    @loses = [Scissors, Rock]
  end
end

class Spock < Move
  def initialize
    @name = 'spock'
    @beats = [Rock, Scissors]
    @loses = [Paper, Lizard]
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
  include TerminalControl
  attr_reader :player, :computer

  def initialize
    @player = Human.new
    @computer = [TheRedQueen, Cerebro, C3PO].sample.new
    @players = [@computer, @player]
  end

  def play_again?
    choice = nil
    loop do
      new_line
      puts 'Would you like to play again?'
      puts "Enter 'Y' for Yes and 'N' for No"
      choice = gets.chomp.downcase
      break if %w(y yes n no).include?(choice)
      puts 'Sorry, you have entered the wrong input.'
    end
    choice == 'y' || choice == 'yes'
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

  private

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
    if player.move > computer.move
      print_winner(player)
      computer.prev_round_won = false
    elsif computer.move > player.move
      print_winner(computer)
      computer.prev_round_won = true
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
    @players.any? { |player| player.score == Score.limit }
  end

  def select_round_numbers
    puts 'How many rounds would you like to play? Max Rounds = 10'
    limit = nil
    loop do
      limit = gets.chomp.to_i
      break if limit.between?(1, 10)
      puts 'Please enter a valid number.'
    end
    player.establish_score(limit)
    computer.establish_score(limit)
  end
end

RPSGame.new.play
