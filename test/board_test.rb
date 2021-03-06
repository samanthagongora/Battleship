require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test
  def test_small_board_to_s
    new_board = Board.new(4)

    expected_board =
      [%i[empty empty empty empty],
       %i[empty empty empty empty],
       %i[empty empty empty empty],
       %i[empty empty empty empty]]

    assert_equal expected_board, new_board.board
  end

  def test_medium_board_to_s
    new_board = Board.new(8)

    expected_board =
      [%i[empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty]]

    assert_equal expected_board, new_board.board
  end

  def test_large_board_to_s
    new_board = Board.new(12)

    expected_board =
      [%i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty],
       %i[empty empty empty empty empty empty empty empty empty empty empty empty]]

    assert_equal expected_board, new_board.board
  end

  def test_contains_returns_corret_boolean_for_coordinates
    newboard4 = Board.new(4)
    new_board_8  = Board.new(8)
    new_board_12 = Board.new(12)

    coordinates_1 = [1, 3]
    coordinates_2 = [5, 0]

    coordinates_3 = [6, 5]
    coordinates_4 = [10, 6]

    coordinates_5 = [11, 8]
    coordinates_6 = [13, 11]

    assert newboard4.contains?(coordinates_1)
    refute newboard4.contains?(coordinates_2)
    assert new_board_8.contains?(coordinates_3)
    refute new_board_8.contains?(coordinates_4)
    assert new_board_12.contains?(coordinates_5)
    refute new_board_12.contains?(coordinates_6)
  end

  def test_empty_returns_correct_boolean_for_coordinates
    newboard4 = Board.new(4)
    new_board_8  = Board.new(8)
    new_board_12 = Board.new(12)

    coordinates_1 = [1, 3]
    coordinates_2 = [6, 5]
    coordinates_3 = [11, 8]
    coordinates_4 = [2, 0]
    coordinates_5 = [7, 5]
    coordinates_6 = [9, 11]

    newboard4.ship([coordinates_4], 1)
    new_board_8.ship([coordinates_5], 1)
    new_board_12.ship([coordinates_6], 1)

    assert newboard4.empty?(coordinates_1)
    assert new_board_8.empty?(coordinates_2)
    assert new_board_12.empty?(coordinates_3)
    refute newboard4.empty?(coordinates_4)
    refute new_board_8.empty?(coordinates_5)
    refute new_board_12.empty?(coordinates_6)
  end

  def test_ship_sets_coordinate_to_ship_space
    newboard4 = Board.new(4)
    new_board_8  = Board.new(8)
    new_board_12 = Board.new(12)

    coordinates_1 = [[1, 3], [1, 2]]
    coordinates_2 = [[6, 5], [7, 5]]
    coordinates_3 = [[11, 8], [10, 8]]

    newboard4.ship(coordinates_1, 2)
    new_board_8.ship(coordinates_2, 2)
    new_board_12.ship(coordinates_3, 2)

    assert_equal 2, newboard4.board[1][3]
    assert_equal 2, newboard4.board[1][2]
    assert_equal 2, new_board_8.board[6][5]
    assert_equal 2, new_board_8.board[7][5]
    assert_equal 2, new_board_12.board[11][8]
    assert_equal 2, new_board_12.board[10][8]
  end

  def test_hit_or_miss_returns_correct_message
    newboard4 = Board.new(4)

    coordinates_1 = [[1, 3], [1, 2]]

    newboard4.ship(coordinates_1, 2)

    actual_1 = newboard4.hit_or_miss([0, 1])
    actual_2 = newboard4.hit_or_miss([1, 3])

    assert_equal :miss, actual_1
    assert_equal :hit, actual_2

    actual_3 = newboard4.hit_or_miss([1, 2])

    assert_equal 2, actual_3
  end
end
