require 'pry'
require 'pry-byebug'

def new_line
  puts "\n"
end

def clear_screen
  system('clear') || system('cls')
end

def tab_pad(num)
  "\t" * num
end

def input_prompt
  print "\e[5m=>\e[0m"
  gets.chomp
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

def hit_or_stay?
  puts "#{tab_pad(3)}Would you like to HIT or STAY"
  puts "#{tab_pad(2)}HIT: 'hit' or 'h'; STAY: 's' or 'stay'"
  answer = get_input(%w(hit h stay s))
  if answer == 'hit' || answer == 'h'
    'hit'
  else
    'stay'
  end
end

def bust(player_str)
  puts "#{player_str} has BUST"
end

def generate_cards
  {
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,
    10 => 10,
    :Jack => 10,
    :Queen => 10,
    :King => 10,
    :Ace => [1, 11] # to be assigned at run time
  }
end

def adjust_ace(deck, suit, player_hand)
  if player_hand[:total] + 11 > 21
    deck[suit][:Ace] = 1
  else
    deck[suit][:Ace] = 11
  end
end

def deal_cards(deck, num, *player)
  player.each do |player_hand|
    num.times do
      random_suit = deck.keys.sample
      random_card = deck[random_suit].keys.sample

      adjust_ace(deck, random_suit, player_hand) if random_card == :Ace

      if player_hand.key?(random_suit)
        player_hand[random_suit] << deck[random_suit].slice(random_card)
      else
        player_hand[random_suit] = [deck[random_suit].slice(random_card)]
      end
      deck[random_suit].delete(random_card)
    end
  end
end

def calc_total(*player)
  player.each do |player_profile|
    player_profile[:total] = 0 # temporarily resets total for incrementation
    player_hand = player_profile.select { |suit| suit != :total }
    player_hand.each do |suit|
      player_hand[suit[0]].each do |card|
        player_profile[:total] += card.values.sum
      end
    end
  end
end

def display_dealer_hand(dealer)
  # p dealer
  dealer_hand = dealer.select { |key| key != :total }

  hand_size = 0
  dealer_hand.each do |suit|
    suit[1].each do |_|
      hand_size += 1
    end
  end

  first_card = dealer_hand.first
  suit = first_card[0].to_s
  card = first_card[1][0].keys[0].to_s

  "#{card} of #{suit} and #{hand_size - 1} more"
end

def display_game_status(player, dealer)
  puts "\e[1m\e[32mYour Total\e[0m: #{player[:total]}"
  puts "\e[1m\e[31mDEALER HAND\e[0m: #{display_dealer_hand(dealer)}"
  new_line
end

## MAIN GAME LOOP ##
deck = {
  hearts: generate_cards,
  diamonds: generate_cards,
  spades: generate_cards,
  clubs: generate_cards
}

player = {
  total: 0
}

dealer = {
  total: 0
}

deal_cards(deck, 2, player, dealer)

# binding.pry

display_dealer_hand(dealer)

## Player Turn ##
loop do
  calc_total(player)
  display_game_status(player, dealer)
  stay = nil
  bust = nil
  if player[:total] > 21
    bust('Player')
    bust = true
  elsif player[:total] == 21
    break
  else
    case hit_or_stay?
    when 'hit'
      deal_cards(deck, 1, player)
    when 'stay'
      stay = true
    end
  end
  break if bust || stay
end

puts "end player turn"
