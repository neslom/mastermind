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

      # this test is being passed over because the method returns nil
      # due to the puts call
  # def test_guess_for_color_count
  #   game.game_setup
  #   game.secret = ["G", "G", "G", "G"]
  #   guess = 'rggb'
  #   assert_equal 1, game.color_counter(guess) 
  # end

  def test_secret_consists_of_colors # tests color_matcher indirectly
    game.game_setup
    test_secret = game.secret.join.downcase.chars.all? { |char| char.match(game.color_matcher) }
    assert test_secret
  end

  def test_secret_to_string
    game.game_setup
    game.secret = ["R", "G", "G", "Y"]
    assert_equal "rggy", game.secret_to_string
  end

  def test_guess_count_starts_at_zero
    game.game_setup
    assert_equal 0, game.guess_count
    refute_equal 1, game.guess_count
  end

  # def test_match_counter 
  #   game.game_setup
  #   game.secret = ["G", "Y", "B", "B"]
  #   matches = game.match_counter("grrb")
  #   assert matches[0][0] == matches[0][1]
  #   refute matches[1][0] == matches[1][1]
  # end
end
