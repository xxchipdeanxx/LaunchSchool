# How would you order this array of number strings by descending numeric value?
#INPUT: arr = ['10', '11', '9', '7', '8']

arr = ['10', '11', '9', '7', '8']

arr.sort! do |a,b|
  b.to_i <=> a.to_i
end

p arr