# Pick out the minimum age from our current Munster family hash:

# ALGORITHM #
# 1. extract the values from hash
# 2. set [0] value to CURRENT value
# 3. compare NEXT value to CURRENT value
# 4. IF NEXT is lower--it replaces current value
# 5. Iterate through the entire array
# 6. Return the final integer

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

