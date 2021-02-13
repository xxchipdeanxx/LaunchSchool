#Given this data structure write some code to return an array which contains only the hashes where all the integers are even.
#ONLY include hash where ALL integers are EVEN
#INPUT: array of hashs
#OUTPUT: NEW array of hashes

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hash|
  hash.all? do |_, array|
    array.all? {|num| num.even?}
  end
end
