enum = Enumerator.new do |y|
  num = 0
  result = 0
  loop do
    result = num.zero? ? 1 : (num * result)
    y << result
    num += 1
  end
end

6.times {|num| puts "#{num}!: #{enum.next}"}
enum.rewind #needed in order for the Enum object to reset back to the first element
puts "\n"
6.times {|num| puts "#{num}!: #{enum.next}"}