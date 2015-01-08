require 'minitest/autorun'
require 'minitest/pride'
require '~/Turing/Projects/mastermind/lib/gameplay'



class GameplayTest < MiniTest::Test
  attr_reader :game, :secret
  def setup
    @game = Gameplay.new
    $stdout = StringIO.new
  end

  def test_it_exists
    assert game
  end

  def test_valid_guess
    guess1 = 'rgby'
    guess2 = "bbbb"
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
    game.game_setup
    game.secret = ["G", "G", "G", "G"]
    guess = 'rggb'
    assert_equal 1, game.color_counter('rggb') 
  end

  def test_secret_consists_of_colors
    # this test also calls color_matcher so it's being tested indirectly
    game.game_setup # must specifically call game_setup to avoid user input loop
    test_secret = game.secret.join.downcase.chars.all? { |char| char.match(game.color_matcher) }
    assert test_secret
  end

  def test_secret_to_string
    game.game_setup
    game.secret = ["R", "G", "G", "Y"]
    assert_equal "rggy", game.secret_to_string
  end



end
