# In this example we want to select the key-value pairs where the value is 'Fruit'.
# EXAMPLE #
# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
  #returns a new hash containig the desired values

# ALGORITHM #
# 1. access the values stored in the hash
# 2. if the value is equal to the string 'fruit'
# 3. store the key/value pair in a new hash
# 4. return the new hash

def select_fruit(hash)
  output_hash = nil
  count = 0
  until count == hash.size
    output_hash = hash.select {|k,v| hash[k] == 'Fruit'}
    count += 1
  end
  output_hash
end