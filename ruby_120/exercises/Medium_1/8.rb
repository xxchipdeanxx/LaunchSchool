# Update this class so you can use it to determine the lowest ranking and 
#highest ranking cards in an Array of Card objects:

#Ranking is based on the 'value' of the card. The 'suit' has no influece
#over the ranking and is only needed for a to_s method

#If you have two or more cards of the same rank in your list, your min and 
#max methods should return one of the matching cards; it doesn't matter 
#which one.

#Ranking
  # all number cards have a rank that is in numerical order
  # face cards
    #Jack < Queen < King < Ace

class Card
  include Comparable
  VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if same_card?(other_card)
      0
    elsif both_number_cards?(other_card)
      rank <=> other_card.rank 
    elsif both_face_cards?(other_card)
      rank_faces(other_card)
    else
      select_face_card(other_card)
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end

  private

  def same_card?(other_card)
    rank == other_card.rank && suit == other_card.suit
  end

  def both_number_cards?(other_card)
    rank.class == Integer && other_card.rank.class == Integer
  end

  def both_face_cards?(other_card)
    rank.class == String && other_card.rank.class == String
  end
  
  def select_face_card(other_card)
    rank.class == Integer ? -1 : 1
  end

  def rank_faces(other_card)
    VALUES[rank] <=> VALUES[other_card.rank]
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
p Card.new('Ace', 'Clubs') == Card.new('Ace', 'Clubs')
p cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
