numbers='1 2 3 4 5 6 7 8 9 10'
chars='abcdefghijklmnopqrstuvwxyz'

num_elements=0

reset_counter () {
  num_elements=0
}

increment () {
  ((num_elements++))
}

for number in $numbers
do
  echo $number
  increment
done

echo number of elements: $num_elements
reset_counter

for char in $chars
do
  echo $char
  increment
done

echo number of elements: $num_elements
reset_counter

#Seems like whitespace acts as a seperator for each element