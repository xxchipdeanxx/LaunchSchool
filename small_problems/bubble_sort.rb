#Create your very own bubble sort method to place the elements in an array
# into ascending order

#Rules
#input - a single dimension array of objects
#output - the same array with the elements sorted in ascending order

#the method will us the default behavior for class comparisons

#array will always contian at least two elements

#Bubble sort goes pair by pair and checks to see if
#object a is greater than object b
# if it is --> the two elements are swapped
# if it is not --> the object remains in place
# the 'bubble' is then shifted to check the new two objects
  # in this case 'b' and 'c'
#the algo will make multiple passes until it no longer needs to shift

#Data - Array

#Algo
#create a sample window with the indicies [0][1]
# if obj at index 1 is greater
  # array[0], array[1] == array[1], array[0]
# incredment out sample indexes and check again
# once at end of sample index
# repeat and scan again
# repeat until array.all? |obj1, obj2| obj1 < obj2
# reuturn the array

require 'pry'

def sorted(array)
  sorted = []
  array.each_with_index do |obj, index|
    sorted << (obj < array[index + 1]) unless index == array.size - 1
  end
  sorted.all?(true)
end

def bubble_sort!(array)
  until sorted(array)
    first = 0
    second = 1
    until second > array.size - 1
      if array[first] > array[second]
        array[first], array[second] = array[second], array[first]
      end
      first += 1
      second += 1
    end
  end
end



array = [5, 3]
bubble_sort!(array)
p array == [3, 5]


array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)