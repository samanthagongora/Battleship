require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require './lib/board'

class BattleshipTest < Minitest::Test
  def test_game_has_welcome_message
    #??
  end

  def test_game_play_sets_two_ships_for_computer
    new_game = Battleship.new
    new_game.new_boards(4)
    new_game.ships
    new_game.ship_placement

    assert_equal 5, new_game.computer_ship_board.board.reduce(0) {|acc, line| acc += line.count { |space| space == :ship }}
  end

end
