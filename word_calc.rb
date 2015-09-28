class WordCalc
  attr_accessor :input, :output
  @@commands = {"plus" => "+", "minus" => "-", "times" => "*", "divide" => "/"}

  def initialize
    self.input  = $stdin
    self.output = $stdout
  end

  def welcome
    self.output.puts "Please use numbers '{1,2,3..}.\n'plus','minus','times', or 'divide' are the operators.\n'help' for instructions.\n'quit' to exit."
  end

  def start
    output.puts "What would you like to calculate?"
    entry = input.gets.chomp
    validate(entry)
  end

  def validate(entry)
    if @@commands.keys.any?{ |key| entry.include?(key) } && entry =~ /\d/
      calculate(entry)
    elsif entry == 'help'
      output.puts "use either \n'plus' for addition\n'minus' for substraction\n'times' for multiplication or\n'divide' for division'\nuse numbers to surround the operator, for example '4 times 8'\ntype 'quit' to exit program'"
      start
    elsif entry == 'quit'
      output.puts "good bye!"
    else
      output.puts "#{entry} is not a valid operator, please type 'help' for instructions."
      start
    end
  end

  def calculate(command)
    command_arr = command.split(" ")
    command_key = command_arr[1]
    command_arr.delete_at(1)
    command_arr.map! {|x| x.to_i}
    output.puts command_arr[0].send(@@commands[command_key],command_arr[1])
    start
  end
end

#calc = WordCalc.new
#calc.start
