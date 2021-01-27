#Write a function that will convert a string into title case, 
#given an optional list of exceptions (minor words). 

#The list of minor words will be given as a string with each word 
#separated by a space. 
#Your function should ignore the case of the minor words string 
#-- it should behave in the same way even if the case of the 
#minor word string is changed.

#Examples
#title_case('a clash of KINGS', 'a an the of') 
# should return: 'A Clash of Kings'

#title_case('THE WIND IN THE WILLOWS', 'The In') 
# should return: 'The Wind in the Willows'

#title_case('the quick brown fox') 
# should return: 'The Quick Brown Fox'

#Rules
#A title -
# Each word has the first letter capitalized
# OR is provided a list of exceptions to NOT be capitalized

#The first word is ALWAYS capitalized --> regardless of exceptions

#exceptions can take any form --> do not follow how they are formatted
# they simply signify which words should be undercased
# this is assuming that none of them are the first word of the title

#if no exceptions are provided --> all words in the title should
# have a capitalized first character
    #title_case('the quick brown fox') --> missing (optional) second arg
    # should return: 'The Quick Brown Fox'

#Input - A string
#Output - a NEW formatted string --> adhering to the exceptions and
# norms of titles --> first word always gas a capital letter

# Data - Array, String

#Algo
# upcase the incoming title --> local_title = title.split.map {capitlaize}
# create a condition for our second argument
  # if exception != nil
    # follow exception rules
  # else --> return string.upcase

#get exceptions into an array containing each indiv. word
  # except_array = exceptions.split
  # ["a", "an", "the", "of"]
#get the title into an array of individual words as well
  # ['A', 'Clash', 'Of, 'Kings']
# iterate through our exception list
# iterate though our title_array
  # if the title contians the exception word AND title_array.fitst != exeption word
    #downcase the word
# return the final title -> title_array.join

#Refactoring
#Option 2


def title_case(title, exceptions = nil)
  if exceptions
    local_title_ary = title.split.map {|word| word.capitalize}
    exceptions_ary = exceptions.split.map {|word| word.capitalize}
    exceptions_ary.each do |except_word|
      local_title_ary.each do |word|
        word.downcase! if word == except_word && local_title_ary.first != word
      end
    end
    local_title_ary.each_with_index {|word, index| word.downcase! if word == "The" && index != 0}    
    return local_title_ary.join(" ")   
  else
    return title.split.map {|word| word.capitalize}.join(" ")
  end
end


p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'