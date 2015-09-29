require 'minitest/autorun'
require './word_calc'

class WordCalcTest < MiniTest::Test

  def setup
    @word = WordCalc.new
  end

  def test_start_message
    output = @word.welcome
    assert_equal "Please use numbers '{1,2,3..}.\n'plus','minus','times', or 'divide' are the operators.\n'help' for instructions.\n'quit' to exit.", output
  end

  def test_error_message
    input = "five and 6"
    output = @word.validate(input)
    assert_equal "five and 6 is not a valid operator, please type 'help' for instructions.", output
  end

  def test_help_message
    input = "help"
    output = @word.validate(input)
    assert_equal "use either \n'plus' for addition\n'minus' for substraction\n'times' for multiplication or\n'divide' for division'\nuse numbers to surround the operator, for example '4 times 8'\ntype 'quit' to exit program'", output
  end

  def test_quit_message
    input = "quit"
    output = @word.validate(input)
    assert_equal "good bye!", output
  end
 
  def test_answer_message
    input = "4 plus 5"
    output = @word.validate(input)
    assert_equal 9, output
  end
end
