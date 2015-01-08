require_relative 'printer'

class Gameplay
  attr_reader :guess_count, :colors
  attr_accessor :secret, :guess
  def initialize(stdin=$stdin, stdout=$stdout)
    @secret = []
    @colors = ["R", "G", "B", "Y"]
    @guess_count = 0
    @stdin = stdin
    @stdout = stdout
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
          puts "\nGuess again!"

          color_counter(guess)
          match_counter(guess)
          puts "\nGuess count: #{guess_count + 1}"
        else
          puts Printer.you_win
          print_time
          break
        end
      else
        puts "Please choose a sequence of #{@colors.size} from: #{ @colors.map {|c| c.to_s }.join(' ') }" unless guess == 'q'
      end
      @guess_count += 1
    end
    puts Printer.exit_game
  end

  def game_setup 
    # set secret to empty to ensure that there are no elements
    # left over from previous rounds
    @start_time = Time.now
    @secret = []
    @guess_count = 0
    @colors.size.times { @secret << @colors.sample }
  end

  def play_time
    (Time.now - @start_time).to_i
  end

  def print_time
    mm, ss = play_time.divmod(60)
    puts "You completed the game in #{mm} minute(s) and #{ss} seconds."
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

  def color_counter(guess)
    correct_elements_guessed = guess.chars.uniq.each_with_object([]) do |item, obj|
      obj << secret_to_string.chars.uniq.count(item)
    end
    total_correct_elements = correct_elements_guessed.reduce(:+)
    puts "\nYou have guessed #{total_correct_elements} correct element(s)."
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
    if counter == 1
      puts "\nYou have #{counter} guess in a correct position."
    else
      puts "\nYou have #{counter} guesses in correct positions."
    end
  end
end
