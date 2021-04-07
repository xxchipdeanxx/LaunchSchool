ENCODING = {
  0 => ')',
  1 =>'!',
  2 =>'@',
  3 =>'#',
  4 =>'$',
  5 =>'%',
  6 =>'^',
  7 =>'&',
  8 =>'*',
  9 =>'('
}

def encode_student_id(id)
  result = id.to_s.each_char.map(&:to_i)
  result.map {|digit| ENCODING[digit]}.join
end

def decode_student_id(string)
  string.each_char.map {|char| ENCODING.key(char)}.join.to_i
end

fake_method = method(:fake_method).to_proc
encode = method(:encode_student_id).to_proc
decode = method(:decode_student_id).to_proc

p fake_method
p encode

student_ids = [8675, 4215, 1111, 8923, 1918, 5896]

p encoded_ids = student_ids.map(&encode)

p decoded_ids = encoded_ids.map(&decode)


#In this example we are able to convert our methods #encode_student_id
#and #decode_student_id into Proc objects which will allow us to then pass
#the behavior into other, iterative methods like #map as a block

#The benefit to being able to do something like this is that we can bundle
#complex behaviors into a compact, easy to transport (for the user) package
#which can then be passed into a variety of methods that may need some
#sort of encoding behavior.

#It is true -  that we could have taken the entire encoding and decoding schemes
#and simply created normal Proc objects from the get-go, but understanding that
#Ruby allows users to create a closure out of their methods via Object#method(symbol)
# and Method#to_proc opens up a world of flexibility. 
