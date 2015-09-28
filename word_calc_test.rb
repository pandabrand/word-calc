require 'minitest/autorun'
require './test_helper'
require './word_calc'

class WordCalcTest < MiniTest::Test
  include TestHelper

  def setup
    @word = WordCalc.new
  end

  def test_start_message
    input = StringIO.new
    output = StringIO.new
    @word.input = input
    @word.output = output
    @word.welcome
    assert_equal "Please use numbers '{1,2,3..}.\n'plus','minus','times', or 'divide' are the operators.\n'help' for instructions.\n'quit' to exit.\n", output.string
  end

  def test_error_message
    input = StringIO.new("five and 6\n")
    output = StringIO.new
    @word.input = input
    @word.output = output
    @word.start
    assert_equal "Check help for instructions", output.string
  end
end
