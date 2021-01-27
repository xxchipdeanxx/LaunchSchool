file = 'sample2_text.txt'.chomp
book = File.read("#{file}")

p book.split(/\.\s|\?\s|!\s/)


# puts "#{sentance}"
# puts "\n"
# puts "#{size}:  words long"