 require 'pry'   

class GuessingGame

  RANGE = (1..100)

  attr_reader :random_number, :remaining_guesses
 
  def initialize
    @random_num = rand(RANGE)
    @remaining_guesses = 7
    @guess = nil
  end

  def play
    loop do 
      break if @guess == @random_num || @remaining_guesses < 1
      display_guesses_left
      get_guess
      evaluate_guess
      decrease_guesses if @guess != @random_num
    end
    display_final_results
  end

  private

  def evaluate_guess
    puts "Your gues is too high" if @guess > @random_num
    puts 'Your guess is too low' if @guess <  @random_num
  end

  def decrease_guesses
    @remaining_guesses -= 1
  end

  def display_guesses_left
    puts "You have #{remaining_guesses} guesses remaining."
  end

  def get_guess
    p "Enter a number between #{RANGE.first} and #{RANGE.last}:"
    input = nil
    loop do
      input = gets.chomp.to_i
      break if RANGE.cover?(input)
      puts 'Please enter a valid entry'
    end
    @guess = input
  end

  def display_final_results
    result = @remaining_guesses >= 1 ? "You won!" : "You have no more guesses. You lost!"
    puts result
  end

end

game = GuessingGame.new
game.play
