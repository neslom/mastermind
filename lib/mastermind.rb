require_relative 'printer'
require_relative 'gameplay'
class Mastermind
  attr_reader :gameplay
  def initialize
    @gameplay = Gameplay.new
  end

  def initial_input(input)
    if input == 'i' || input == "instructions"
      puts Printer.instructions
    elsif input == 'p' || input == 'play'
      gameplay.play
    else
      puts Printer.main_menu unless input == 'q'
    end
  end
end



if __FILE__ == $0
  puts Printer.welcome_message
  input = ""
  mastermind = Mastermind.new

  while input != "q"
    print "> "
    input = gets.chomp.downcase
    mastermind.initial_input(input)
  end

  gameplay = Gameplay.new
  gameplay.save_game_stats
  puts "Goodbye!"

end
