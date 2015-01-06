require 'pry'
require_relative 'printer'
class Gameplay
  attr_reader :secret, :guess_count, :colors
  attr_accessor :secret
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

          color_counter_revised(guess)
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
      puts Printer.too_few unless guess == 'q'
      false
    elsif guess.size > @colors.size
      puts Printer.too_many unless guess == 'q'
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

  # def color_counter_revised(guess)
  #   non_elements = nil
  #   if secret_to_string.chars == secret_to_string.chars.uniq
  #     # if secret is all unique characters
  #     # non = rgby - 
  #     non_elements = (secret_to_string.chars - guess.chars).size
  #   else
  #     # if secret is not all unique chars, 
  #     non_elements = (guess.chars - secret_to_string.chars).size
  #   end
  #   if guess.chars == guess.chars.uniq 
  #     non_elements = (guess.chars - secret_to_string.chars).size
  #   else
  #     non_elements = (secret_to_string.chars - guess.chars).size
  #   end
  #   correct_elements = secret.size - non_elements
  #   puts "Your guess has #{correct_elements} correct elements."
  # end
  def color_counter_revised(guess)
    guess.chars.uniq.each_with_object([]) do |item, obj| 
      obj << secret_to_string.chars.uniq.count(item)
    end.reduce(:+)
  end

    # when secret chars are all unique and guess is "gggg"
    # color_counter_revised returns "one correct element"
    # when (secret_to_string.chars - guess.chars).size = non

    # when secret chars are all the same and guess is "gggg"
    # it returns nil

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
    if counter == 1
      puts "You have #{counter} guess in a correct position."
    else
      puts "You have #{counter} guesses in correct positions."
    end
  end


  def save_game_stats(to_file = "game_stats.txt")
    File.open(to_file, 'w') do |file|
      file.puts "Mastermind Game Stats:"
      # @players.sort.each do |player|
      #   file.puts high_score_entry(player)
      # end
    end
  end
  # if guess has multiple characters that exist in the secret
  # we only need to say that the guess has one correct element
end
