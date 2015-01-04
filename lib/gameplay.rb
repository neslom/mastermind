require 'pry'
require_relative 'printer'
class Gameplay
  attr_reader :secret, :guess_count
  def initialize
    @secret = []
    @colors = ["R", "G", "B", "Y"]
    @guess_count = 0
  end

  def play
    puts Printer.play

    puts Printer.enter_guess

    game_setup

    guess = ''
    while guess != 'q'
      print "> "
      guess = gets.chomp.downcase

      if valid_guess?(guess)
        if guess != secret_to_string
          puts "Guess again!"

          color_counter(guess)
          match_counter(guess)
        else
          puts Printer.you_win
          break
        end
      else
        puts "Please choose a sequence of #{@colors.size} from: #{ @colors.map {|c| c.to_s }.join(' ') }" unless guess == 'q'
      end
      @guess_count += 1
    end
    puts Printer.exit_game
  end

  def secret_to_string
  	@secret.join("").downcase
  end

  def color_matcher
    match = @colors.map { |color| color.downcase }
    .join("")
    match = '[' + match + ']'
    Regexp.new match
  end

  def valid_guess?(guess)
    if guess.size < @colors.size
      #puts Printer.too_few unless guess == 'q'
      false
    elsif guess.size > @colors.size
      #puts Printer.too_many unless guess == 'q'
      false
    elsif guess.chars.all? { |char| char.match(color_matcher) } == false
      false
    else
      true
    end
  end

  def game_setup
    if @secret.empty?
      4.times { @secret << @colors.sample } # to test this I have to push the same letter
    else
      @secret = []
      4.times { @secret << @colors.sample }
    end
  end

  def color_counter(guess)
  	number_of_color_occurences = guess.count(@secret.uniq.to_s.downcase)
  	puts "#{number_of_color_occurences} of your guessed characters match a correct color"
  end

  def match_guess_with_secret(guess)
  	guess_characters = guess.chars
  	secret_characters = @secret.map! { |char| char.downcase }
  	matched_sets = guess_characters.zip(secret_characters)
  end

  def match_counter(guess)
  	counter = 0
  	match_guess_with_secret(guess).each do |matches|
  	  if matches[0] == matches[1]
  	  	counter += 1
  	  end
    end
    puts "You have #{counter} guess in correct positions"
  end

end

# a = [1, 2, 3]
# b = [1, 4, 3]

# a.zip(b).map { |x, y| x == y } # [true, false, true]
