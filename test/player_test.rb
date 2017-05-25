require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/board'
require 'pry'

class PlayerTest < Minitest::Test
  def test_convert_to_ship_coordinates_returns_false_for_invalid_input
    player = Player.new
    actual_1 = player.convert_to_ship_coordinates('',2)
    actual_2 = player.convert_to_ship_coordinates('12832',2)
    actual_3 = player.convert_to_ship_coordinates('DADSI',3)
    actual_4 = player.convert_to_ship_coordinates('A1 A2 A3 A4 A', 5)
    actual_5 = player.convert_to_ship_coordinates('1 A2 A3 A4 A5', 4)
    actual_6 = player.convert_to_ship_coordinates('A1 A2 AA A4 A5', 5)
    actual_7 = player.convert_to_ship_coordinates('A1 22 A4 A5', 4)

    refute actual_1
    refute actual_2
    refute actual_3
    # binding.pry
    refute actual_4
    refute actual_5
    refute actual_6
    refute actual_7
  end

  def test_convert_coordinates_works_for_all_size_ships
    player = Player.new
    actual_1 = player.convert_to_ship_coordinates('B5 B6', 2)
    actual_2 = player.convert_to_ship_coordinates('C1 B1 A1', 3)
    actual_3 = player.convert_to_ship_coordinates('D3 E3 F3 G3', 4)
    actual_4 = player.convert_to_ship_coordinates('A1 A2 A3 A4 A5', 5)

    assert_equal [[1, 4], [1, 5]], actual_1
    assert_equal [[2, 0], [1, 0], [0, 0]], actual_2
    assert_equal [[3, 2], [4, 2], [5, 2], [6, 2]], actual_3
    assert_equal [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4]], actual_4
  end

  def test_sequential_correctly_returns_for_coordinates
    skip
    player = Player.new
    actual_1 = player.sequential?([[1, 5], [1, 6]])
    actual_2 = player.sequential?([[3, 1], [1, 1], [0, 1]])
    actual_3 = player.sequential?([[1, 5], [2, 6]])
    actual_4 = player.sequential?([[3, 1], [1, 2], [0, 1]])

    assert_equal true, actual_1
    assert_equal true, actual_2
    assert_equal false, actual_3
    assert_equal false, actual_4
  end
end
