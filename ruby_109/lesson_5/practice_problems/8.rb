# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, array|
  array.each do |word|
    word.chars.each do |letter|
      puts letter if %w(a e i o u).include?(letter)
    end
  end
end
