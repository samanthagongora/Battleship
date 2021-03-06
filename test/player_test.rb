require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/board'

class PlayerTest < Minitest::Test
  def test_convert_to_ship_coordinates_returns_false_for_invalid_input
    player = Player.new
    new_board = Board.new(8)

    actual_1 = player.convert_to_ship_coordinates(new_board, '', 2)
    actual_2 = player.convert_to_ship_coordinates(new_board, '12832', 2)
    actual_3 = player.convert_to_ship_coordinates(new_board, 'DADSI', 3)
    actual_4 = player.convert_to_ship_coordinates(new_board, 'A1 A2 A3 A4 A', 5)
    actual_5 = player.convert_to_ship_coordinates(new_board, '1 A2 A3 A4 A5', 4)
    actual_6 = player.convert_to_ship_coordinates(new_board, 'A1 A2 AA A4 A5', 5)
    actual_7 = player.convert_to_ship_coordinates(new_board, 'A1 22 A4 A5', 4)

    refute actual_1
    refute actual_2
    refute actual_3
    #
    refute actual_4
    refute actual_5
    refute actual_6
    refute actual_7
  end

  def test_convert_coordinates_works_for_all_size_ships
    player = Player.new
    new_board = Board.new(8)

    actual_1 = player.convert_to_ship_coordinates(new_board, 'B5 B6', 2)
    actual_2 = player.convert_to_ship_coordinates(new_board, 'C1 B1 A1', 3)
    actual_3 = player.convert_to_ship_coordinates(new_board, 'D3 E3 F3 G3', 4)
    actual_4 = player.convert_to_ship_coordinates(new_board, 'A1 A2 A3 A4 A5', 5)

    assert_equal [[1, 4], [1, 5]], actual_1
    assert_equal [[2, 0], [1, 0], [0, 0]], actual_2
    assert_equal [[3, 2], [4, 2], [5, 2], [6, 2]], actual_3
    assert_equal [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4]], actual_4
  end

  def test_valid_returns_correct_boolean_for_coordinates
    player = Player.new
    new_board = Board.new(4)

    new_board.ship([[0, 1], [0, 2]], 2)

    actual_1 = player.valid_ship_coordinates?(new_board, [[0, 1], [0, 2]])
    actual_2 = player.valid_ship_coordinates?(new_board, [[5, 2], [5, 3]])
    actual_3 = player.valid_ship_coordinates?(new_board, [[1, 2], [3, 4]])
    actual_4 = player.valid_ship_coordinates?(new_board, [[8, 2], [9, 6]])
    actual_5 = player.valid_ship_coordinates?(new_board, [[1, 3], [1, 2]])

    refute actual_1
    refute actual_2
    refute actual_3
    refute actual_4
    assert actual_5
  end

  def test_sequential_correctly_returns_for_coordinates
    player   = Player.new
    actual_1 = player.sequential?([[1, 5], [1, 6]])
    actual_2 = player.sequential?([[2, 1], [1, 1], [0, 1]])
    actual_3 = player.sequential?([[1, 5], [2, 6]])
    actual_4 = player.sequential?([[3, 1], [1, 2], [0, 1]])

    assert_equal true, actual_1
    assert_equal true, actual_2
    assert_equal false, actual_3
    assert_equal false, actual_4
  end
end
