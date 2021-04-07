#Write a class BeerSong that has a class method ::verse that will take
#an integer number that represents the verse of 99 bottles of beer and
#returns that specific string
  #The method should be able to take multiple integer arguments
    #this should create a range that will count down from the first argument
      #Firt Arg = beginning verse
      #Second Arg = last verse///
  #IF 0 is an input -- you display a special verse

#the class ALSO has a ::lyrics class method that will return the lyrics for
#the ENTIRE song, starting from 99 all the way down to 0 inclusivly

#we'll need to create a local string and add each verse as it iterates
#and then we finally return that final string
require 'pry'

class BeerSong

  @@verse = "%<number>s bottles of beer on the wall, %<number>s bottles of beer.\n" \
  "Take one down and pass it around, %<one_less>s %<bottle>s of beer on the wall.\n"

  ONE_BOTTLE = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
  "Take it down and pass it around, no more bottles of beer on the wall.\n"

  NO_BOTTLES = "No more bottles of beer on the wall, no more bottles of beer.\n" \
  "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  def self.verse(start_verse, end_verse = start_verse)
    result = []
    start_verse.downto(end_verse) do |num|
      if num == 2
        result << format(@@verse, number: num, one_less: (num - 1), bottle: 'bottle')
      elsif num == 1
        result << ONE_BOTTLE
      elsif num == 0
        result << NO_BOTTLES
      else
        result << format(@@verse, number: num, one_less: (num - 1), bottle: 'bottles')
      end       
    end
    result.join("\n")
  end

  def self.verses(start_verse,end_verse)
    verse(start_verse,end_verse)
  end

  def self.lyrics
    verse(99,0)
  end
end

# binding.pry
# BeerSong.verses(99,98)


