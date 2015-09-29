class WordCalcUI
  attr_accessor :input, :output
  @word
  def initialize
    self.input  = $stdin
    self.output = $stdout
    @word = WordCalc.new
  end
  
  def start
    output.puts @word.welcome
    output.puts @word.start
    entry = input.gets.chomp
    send entry
  end

  def send(entry)
    result = @word.validate entry
    output.puts result
    unless result == 'good bye!'
      output.puts @word.start
      send input.gets.chomp
    end
  end
end

class WordCalc
  @@commands = {"plus" => "+", "minus" => "-", "times" => "*", "divide" => "/"}

  def welcome
     "Please use numbers '{1,2,3..}.\n'plus','minus','times', or 'divide' are the operators.\n'help' for instructions.\n'quit' to exit."
  end

  def start
    "What would you like to calculate?"
  end

  def validate(entry)
    if @@commands.keys.any?{ |key| entry.include?(key) } && entry =~ /\d/
      calculate(entry)
    elsif entry == 'help'
      "use either \n'plus' for addition\n'minus' for substraction\n'times' for multiplication or\n'divide' for division'\nuse numbers to surround the operator, for example '4 times 8'\ntype 'quit' to exit program'"
    elsif entry == 'quit'
      "good bye!"
    else
      "#{entry} is not a valid operator, please type 'help' for instructions."
    end
  end

  def calculate(command)
    command_arr = command.split(" ")
    command_key = command_arr[1]
    command_arr.delete_at(1)
    command_arr.map! {|x| x.to_i}
    command_arr[0].send(@@commands[command_key],command_arr[1])
  end
end

calc = WordCalcUI.new
calc.start
