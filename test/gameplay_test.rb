require 'minitest/autorun'
require 'minitest/pride'
require '~/Turing/Projects/mastermind/lib/gameplay'



class GameplayTest < MiniTest::Test
  attr_reader :game
  def setup
    @game = Gameplay.new
  end

  def test_it_exists
    assert game
  end

  def test_valid_guess
    guess1 = 'rgby'.downcase # calling downcase here b/c user input
    guess2 = "BBBB".downcase # will have the method called on it
    assert game.valid_guess?(guess1)
    assert game.valid_guess?(guess2)
  end

  def test_invalid_guess
    refute game.valid_guess?("rgb1")
    refute game.valid_guess?("rgb")
    refute game.valid_guess?("ybg ")
    refute game.valid_guess?('[]')
  end

  def test_guess_for_color_count
    skip
    # since game_setup method is called when play is envoked & play isn't called unless in REPL
    # I have to manually set @secret to equal ["G", "G", "G", "G"]
    guess = 'rggb'
    assert_equal 2, game.color_counter('rggb') 
  end

end
