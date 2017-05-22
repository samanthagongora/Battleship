require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_game_has_welcome_message
    new_game = Battleship.new

    return_value = new_game.welcome_message

    assert_equal welcome_message, return_value
  end

  def test_game_has_instructions
  end

  def test_game_quits_when_press_q
  end

  def test_game_commences_when_press_p
  end 

  def welcome_message
    "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end
