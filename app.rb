require_relative 'app/interface'

@interface = Interface.new

method_name = ARGV[0]
method_argument = ARGV[1]

case method_name
when 'total_spend'
  if method_argument == nil
    puts "You must pass an email as argument"
  else
    # p method_argument.to_s
    puts 'searching database.......'
    puts "£#{@interface.total_spent_by_user(method_argument)}"
  end
when condition

end
