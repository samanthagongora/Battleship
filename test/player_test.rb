require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_ship_coordinates_only_accepts_valid_coordinates
    new_board = Board.new(4)
    player = Player.new

    player.ship_coordinates(new_board, 2)
  end
end
