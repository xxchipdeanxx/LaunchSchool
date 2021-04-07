#Origional#
# def compute
#   block_given? ? yield : 'Does not compute.'
# end

#Refactor#
def compute(arg)
  block_given? ? yield(arg) : arg
end

#Origional Tests#
# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

#Refactor Tests#
p compute(3) {|num| num + 1} == 4
p compute('Hello') {|string| "#{string} world!"} == 'Hello world!'
p compute([1,2,3,4]) == [1,2,3,4]