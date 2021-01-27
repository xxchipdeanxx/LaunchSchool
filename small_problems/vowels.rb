#Write a method that takes an array of strings, and returns an array of 
#the same string values, except with the vowels (a, e, i, o, u) removed.

#Rules
#input - an Array of strings
#output - an Array of the SAME strings with just the vowels removed

#SAME string values must be returned
# preserve case

#empty string should be returnd all entries were vowels


#Data - Array

#Algo
#iterate through each array elements and delete all vowels
#return the origional object into the array
#return the array

require 'pry'


def remove_vowels(array)
  array.map {|string| string.delete('aeiouAEIOU')}
end




p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']