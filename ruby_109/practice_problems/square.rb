#Given an integral number, determine if it's a square number:

# Examples #
# -1  =>  false
#  0  =>  true
#  3  =>  false
#  4  =>  true
# 25  =>  true
# 26  =>  false

# Rules #
#Input -  an integer number
#Ouput - true or false depending

# Math is a modules that provides more robust math operations accross
# Numerical classes


def is_square(x)
  x < 0 ? false : Math.sqrt(x) % 1 == 0
end

