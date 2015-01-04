require 'minitest/autorun'
require 'minitest/pride'
require '~/Turing/Projects/mastermind/lib/mastermind'

class MastermindTest < Minitest::Test
	attr_reader :mm
	def setup
		@mm = Mastermind.new
	end
  def test_it_exists
    assert mm
  end

  def test_i_input_prints_instructions
  	assert_equal Printer.instructions, mm.initial_input('i')
  end

  def test_invalid_input_prints_main_menu
  	assert_equal Printer.main_menu, mm.initial_input(4)
  	assert_equal Printer.main_menu, mm.initial_input({})
  end



  # def test_it_wins
  # 	skip
  #   result = mm.initial_input("BBGB")
  #   assert result.downcase.include?("win")
  # end

  # def test_returns_shuffled_array_of_letters
  # 	output = mm.stub :game_setup, ["R", "B", "Y", "G"]
  # 	assert_equal ["R", "B", "Y", "G"], output
  # end

end
