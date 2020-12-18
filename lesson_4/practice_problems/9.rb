# Write your own version of the rails titleize implementation.

## EXAMPLE ##
# words = "the flintstones rock"
# words = "The Flintstones Rock"

def titleize(string)
  title_str = string.split.map {|letter| letter.capitalize}
  title_str.join(" ")
end