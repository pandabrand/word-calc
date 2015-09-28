require 'minitest/autorun'
require './test_helper'
require './word_calc'

class WordCalcTest < MiniTest::Test
  include TestHelper

  def test_start_message
    output = local_io("") {WordCalc.new}
    assert_equal "Please use numbers '{1,2,3..}.\n'plus','minus','times', or 'divide' are the operators.\n'help' for instructions.\n'quit' to exit.\n", output
  end
  
  def test_error_message
    word = WordCalc
    output = local_io("") {word.new}
    output = local_io("nine and 6") {word.start}
    puts output
  end
end
