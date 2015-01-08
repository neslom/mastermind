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
    test_output = StringIO.new
    readable_output = Mastermind.new(StringIO.new, test_output)
    result = Printer.instructions   
    readable_output.initial_input("i")
    test_output.rewind

    assert_equal result, test_output.read.chop # chops \n char
  end

  def test_invalid_input_prints_main_menu
    test_output = StringIO.new
    readable_output = Mastermind.new(StringIO.new, test_output)
    result = Printer.main_menu  
    readable_output.initial_input("999")
    test_output.rewind

    assert_equal result, test_output.read
  end

  # def test_p_starts_game
  #   test_output = StringIO.new
  #   readable_output = Mastermind.new(StringIO.new, test_output)
  #   result = Printer.play
  #   readable_output.initial_input("p")
  #   test_output.rewind
  #   assert test_output.include?(result)
  # end
end
