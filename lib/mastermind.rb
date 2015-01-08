require_relative 'printer'
require_relative 'gameplay'

class Mastermind
  attr_reader :gameplay
  def initialize(stdin=$stdin, stdout=$stdout)
    @gameplay = Gameplay.new
    @stdin = stdin
    @stdout = stdout
  end

  def initial_input(input)
    if input == 'i' || input == "instructions"
      @stdout.puts Printer.instructions
    elsif input == 'p' || input == 'play'
      gameplay.play
    else
      @stdout.puts Printer.main_menu unless input == 'q'
    end
  end

  def save_game_stats(to_file = "game_stats.txt")
    File.open(to_file, 'w') do |file|
      file.puts "Mastermind Game Stats:\n\nFeature currently unavailable."
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

  mastermind.save_game_stats
  puts "Goodbye!".red

end
