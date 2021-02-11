#Complete this class so that the test cases shown below work as intended. 
#You are free to add any methods or instance variables you need. However, 
#do not make the implementation details public.

#You may assume that the input will always fit in your terminal window.

#Extra
#Allow to optionally select a fixed width
  #determine what should happen if the width is either too narrow or too wide
#message should be center in the banner of the specified width

#custom width
#input - string
#output -formatted string to fit space

#rules
#width to mean the entire length of chars that creates a box
# width can NOT be any less than 5 chars long
  #if the width is less -- return an error
#if the width is larger than the string size
  # center the sting in the width size
  # format the other lines
    # top line should be '+' + "-" times the width minus 2 + "+"
    # empty line should be "|" + " " times the width minues 2 + "|"
    # text line should centered in the entire space --> width
     # empty line should be "|" + " " times the width minues 2 + "|"

#custom message line
# break the string into words
# if the largest word fits is the space --> print a word on each line
# 


require 'pry'

class Banner
  def initialize(message, width = nil)
    @message = message
    @width = width == nil ? message.size : width - 2
    @custom_size = !(@message.length == @width)
  end

  def to_s
    @custom_size ? custom_width : standard_width
  end

  private

  def standard_width
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  def custom_width
    [horizontal_rule, empty_line, custom_message_line, empty_line, horizontal_rule].join("\n")
  end

  def horizontal_rule
    "+#{'-'* @width}+"
  end

  def empty_line
    "|#{' '* @width}|"
  end

  def message_line
    "|#{@message}|"
  end

  def custom_message_line
    if @width > @message.length
      "|#{@message.center(@width)}|"
    else
      
    end
  end
end

# binding.pry
banner = Banner.new('To boldly go where no one has gone before.',7)
puts banner

# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# +-----------------------------------------------+
# |                                               |
# |  To boldly go where no one has gone before.   |
# |                                               |
# +-----------------------------------------------+

#+---+
#| T |
#| e |
#| s |
#| t |
#+---+

# +-----+
# | Te  |
# | st  |
# |     |
# +-----+