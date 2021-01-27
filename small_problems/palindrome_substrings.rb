#Write a method that returns a list of all substrings of a string that are 
#palindromic. That is, each substring must consist of the same sequence of 
#characters forwards as it does backwards. The return value should be arranged 
#in the same sequence as the substrings appear in the string. 
#Duplicate palindromes should be included multiple times.

#For the purposes of this exercise, you should consider all characters and 
#pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" 
#nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

#Problem
#break a string down into its substrings and only populate an array
#if the substring is considered a palindrome

#Rules
#input - string
#output - array --> containing only palindrom sub str

#substring must be at least two char long
#cases DO matter
  #"AbcbA" is a palindrom
  # abcbA is NOT

#all chars should be in consideration for palindrome
# return an empty array if there are no matches

#array does NOT need to be sorted

#Data - Array

#Algo
#call our helper method to generate all possible sub strings
# match only:
  #if the sub str length is two or more chars
  # and the sub str == the substr reversed
# if the condition is a match --> populate the array
# return the array



def leading_substrings(string)
  sub_strings = []
  (1..string.size).each do |sample_size|
    sub_strings << string[0,sample_size]
  end
  sub_strings
end

def substrings(string)
  sub_str = []
  (0...string.size).each do |start_index|
    sub_str << leading_substrings(string[start_index..-1])
  end
  sub_str.flatten
end

def palindrome?(string)
  string.size > 1 && string == string.reverse
end

def palindromes(string)
  substrings(string).select! do |substring|
    palindrome?(substring)
  end
end



p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]