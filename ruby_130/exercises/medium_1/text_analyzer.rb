class TextAnalyzer
  def process
    text = File.read('sample_text.txt')
    yield(text)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines"}
analyzer.process { |text| puts "#{text.split.count} words"}


#Example Output$
# 3 paragraphs
# 15 lines
# 126 words

##Pros and Cons of using File::open or File::read##
