#Modify the method below so that the display/output of items is moved to a block, 
#and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather_items(items)
  puts "Let's start gathering food."
  yield(items)
  puts 'Looks tasty'
end

gather_items(items) {|items| puts "#{items.map(&:upcase).join(" ")}"}