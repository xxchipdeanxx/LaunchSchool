require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'text_class'

Minitest::Reporters.use!

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt')
  end

  def test_swap
    text = Text.new(@file.read)

    expected_text = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    actual_text = text.swap('a','e')

    assert_equal expected_text, actual_text
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end

#The hand-typed string may seem a little excessive, but if the goal was to truly
#test the #swap method as the soul variable/dependency. The hand typed version 
#would be the way to go...assuming there was no user error during typing.

#But the goal of any good test is to eliminate as many variables or areas that could
#skew the results. If we only end up testing ONE element or ONE function per test -- then we
# are in a good place. ASSUME NOTHING
