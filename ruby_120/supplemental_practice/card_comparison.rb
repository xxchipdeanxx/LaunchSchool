# Here is a little twist on a Medium example problem. Can you debug and get all
# test cases to return true.
  # Should only need one more method and one more conditional
  ## OR ## a tweak to an existing method

    class Card
      include Comparable
      VALUES = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
      attr_reader :rank, :suit
    
      def initialize(rank, suit)
        @rank = rank
        @suit = suit
      end
    
      def <=>(other_card)
        if both_number_cards?(other_card)
          rank_number_cards(other_card)
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

      def rank_number_cards(other_card) #area of focus
        rank <=> other_card.rank
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
        VALUES[rank] > VALUES[other_card.rank] ? 1 : -1
      end
    end
    
    cards = [Card.new(2, 'Hearts'),
             Card.new('King', 'Diamonds'),
             Card.new('Ace', 'Clubs')]
    puts cards
    puts cards.min == Card.new(2, 'Hearts')
    # p cards.max
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

    ## Solution ##
    #The way we have defined the comparison method, specifically when
    # we deal with two face cards --> we have not provided a way for a
    # 0 to ever be returned. Which is what (==) seeks in order to 
    # evaluate as true.

    #Since we use <=> with our digit cards, which borrows the <=> method defined
    # in the integer class --> we do not get this problem. It has a complete
    #definition

    #This problem highlights the fact that <=> is seeking a 1, -1, and 0 in
    # order to be fully implemted properly
      #technically it only needs a positive, negative, and 0 or (nil) if
      #two objects are not comparable

    #MOST of the time we would technically borrow from a core class and would
    #never run into this situaton, but it IS important to understand how
    #<=> is implented and the fact that when we define <=> we are technically
    #creating the (< , <=, ==, >=, >) methods all under one method
    
    # def same_card?(other_card)
    #   rank == other_card.rank && suit == other_card.suit
    # end ---> return 0