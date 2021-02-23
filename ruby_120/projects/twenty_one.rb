module TerminalControl
  def press_enter
    puts 'Press ENTER to continue'
    loop do
      input = gets.chomp
      break if input.empty?
      puts 'Invalid input'
    end
  end

  def new_line
    puts
  end

  def clear
    system('clear') || system('cls')
  end
end

module Hand
  include TerminalControl
  def show_hand
    new_line
    puts "----Player: #{name}----"
    puts 'Hand:'
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "Total: #{total}"
    new_line
  end

  def total
    total = 0
    cards.each do |card|
      total += card.value
    end
    total
  end
end

class Participant
  include Hand
  attr_accessor :name, :cards

  def initialize
    @name = set_name
    @cards = []
  end

  def add_card(new_card)
    if new_card.face == "Ace" && (total + 11 > 21)
      new_card.value = 1
    end
    cards << new_card
  end

  def to_s
    name
  end

  def bust?
    total > 21
  end

  def black_jack?
    total == 21
  end

  def clear_cards
    cards.clear
  end
end

class Player < Participant
  def set_name
    puts 'Please enter your name'
    name = nil
    loop do
      name = gets.chomp
      break unless name.empty?
      puts 'Please enter a name'
    end
    name
  end
end

class Dealer < Participant
  NAMES = %w(Dealer Computer CPU)
  def set_name
    NAMES.sample
  end

  def show_flop
    new_line
    puts "----Player: #{name}----"
    puts 'Hand:'
    puts "=> #{cards.first}"
    puts "Total: ??"
    new_line
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = nil
  end

  def draw_one
    cards.pop
  end

  def generate_new
    deck = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        deck << Card.new(suit, face)
      end
    end
    self.cards = deck.shuffle!
  end
end

class Card
  SUITS = %w(Hearts Spades Clubs Diamonds)
  FACES = ('1'..'9').to_a + %w(King Queen Jack Ace)
  attr_accessor :suit, :face, :value

  def initialize(suit, face)
    @suit = suit
    @face = face
    @value = apply_value(face)
  end

  def to_s
    "The #{face} of #{suit}"
  end

  private

  def apply_value(face)
    self.value = if /[[:digit:]]/.match?(face)
                   face.to_i
                 elsif face == 'Ace'
                   11
                 else
                   10
                 end
  end
end

class Game
  include TerminalControl
  attr_reader :participants, :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @participants = [@player = Player.new, @dealer = Dealer.new]
  end

  def play
    display_welcome_message
    loop do
      reset
      initial_deal
      display_flop
      main_game
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def reset
    deck.generate_new
    participants.each(&:clear_cards)
  end

  def play_again?
    new_line
    puts 'Would you like to play another hand?'
    puts "Enter 'Y' for Yes and 'N' for No"
    input = nil
    loop do
      input = gets.chomp.downcase
      break if %w(y yes n no).include?(input)
      puts "Please enter 'Y' or 'N'."
    end
    %w(y yes).include?(input)
  end

  def main_game
    player_turn
    dealer_turn
    final_results
  end

  def player_turn
    loop do
      break if player.bust? || player.black_jack?
      clear
      player.show_hand
      decision = hit_or_stay
      case decision
      when 'h' then draw(player)
      when 's' then break
      end
    end
  end

  def dealer_turn
    loop do
      break if participants.any?(&:bust?) || dealer.total >= 17
      draw(dealer)
    end
  end

  def final_results
    clear
    participants.each(&:show_hand)
    if any_busts?
      display_bust
    elsif winner?
      display_winner
    else
      puts "It's a tie!"
    end
  end

  def winner?
    player.total > dealer.total || dealer.total > player.total
  end

  def display_winner
    winner = player.total > dealer.total ? player.to_s : dealer.to_s
    puts "#{winner} has won this hand"
  end

  def any_busts?
    !!(participants.select(&:bust?).first)
  end

  def display_bust
    busted = player.bust? ? player.to_s : dealer.to_s
    puts "#{busted} has gone bust!"
  end

  def hit_or_stay
    puts 'Would you like to hit or stay?'
    puts "Enter 'H' for Hit and 'S' for Stay"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include?(answer)
      puts 'Please enter a valid selection'
    end
    answer
  end

  def display_flop
    clear
    player.show_hand
    dealer.show_flop
    press_enter
  end

  def initial_deal
    2.times do
      player.add_card(deck.draw_one)
      dealer.add_card(deck.draw_one)
    end
  end

  def draw(participant)
    participant.add_card(deck.draw_one)
  end

  def display_welcome_message
    clear
    puts 'Welcome to Twenty-One!'.center(80)
    press_enter
  end

  def display_goodbye_message
    puts 'Thanks for playing!'
    puts "Bye bye"
  end
end

game = Game.new
game.play
