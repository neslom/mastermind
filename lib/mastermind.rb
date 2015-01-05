#require 'pry'
require_relative 'printer'
require_relative 'gameplay'
class Mastermind
	attr_reader :gameplay, :acceptable_input
	def initialize
		@acceptable_input = ['i', 'p', 'q']
		@gameplay = Gameplay.new
	end
  def initial_input(input)
  	input = input.downcase if input.is_a?(String)
    if acceptable_input.include?(input)
	 		if input == 'i'
	    	Printer.instructions
	    elsif input == 'p'
	    	gameplay.play
	    end
	  else
	    Printer.main_menu unless input == 'q'
	  end
  end
end




# end

# mm = Mastermind.new
# mm.game_setup
# p mm.secret
if __FILE__ == $0
	puts Printer.welcome_message

	input = ""
	mastermind = Mastermind.new

	while input != "q"
	  print "> "
	  input = gets.chomp
	  puts mastermind.initial_input(input)
	end
	gameplay = Gameplay.new
	gameplay.save_game_stats
	puts "Goodbye!"

end
