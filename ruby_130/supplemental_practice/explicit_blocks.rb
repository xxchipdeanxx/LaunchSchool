def each(array,&explicit_block)
  p explicit_block.class
  index = 0
  while index < array.size
    explicit_block.call(array[index])
    index += 1
  end
  array
end


