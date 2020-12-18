#Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.
# Return colors of fruits -- capitalized
# Return sizes of vegetables -- upcased

#INPUT: hash
#OUTPUT: NEW array

## EXAMPLE OUTPUT ##
#[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

array = []
hsh.each_value do |details|
  if details[:type] == 'fruit'
    array << details[:colors].map {|color| color.capitalize}
  else
    array << details[:size].upcase
  end
end

p array

