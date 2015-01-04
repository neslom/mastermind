module Printer
  def self.welcome_message
  	"Welcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.you_win
  	"Congratulations! You win!"
  end

  def self.instructions
  	"Instructions:\n\nTry to solve the code by choosing the correct color for each of the four slots.\n\nWould you like to (p)lay or (q)uit?"
  end

  def self.play
  	"Excellent.\nI have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  end

  def self.invalid_guess_input
  	"Please enter four acceptable characters"
  end

  def self.main_menu
  	"Main menu:\np to play\ni for instructions\nq to quit"
  end

  def self.enter_guess
  	"Please enter a guess:"
  end

  def self.exit_game
    "Would you like to exit the game, or play again? Press q to exit and p to play again"
  end

  def self.too_few
    "Too few characters. Try again."
  end

  def self.too_many
    "Too many characters. Try again"
  end
  
end