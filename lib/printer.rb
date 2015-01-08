require 'colorize'

class Printer
  def self.welcome_message
    "\nWelcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?".green
  end

  def self.you_win
    "Congratulations! You win!"
  end

  def self.instructions
    "Instructions:\n\nTry to solve the code by choosing the correct color for each of the four slots.\n\nWould you like to (p)lay or (q)uit?".cyan
  end

  def self.play
    "Great!\n\nI have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\n"
  end

  def self.invalid_guess_input
    "Please enter four acceptable characters"
  end

  def self.main_menu
    "Main menu:\np to play\ni for instructions\nq to quit\n"
  end

  def self.enter_guess
    "Please enter a guess:"
  end

  def self.exit_game
    "Would you like to exit the game, or play again? Press q to exit and p to play again".yellow
  end

  def self.too_few
    "\nToo few characters. Try again.".red
  end

  def self.too_many
    "\nToo many characters. Try again".red
  end
end
