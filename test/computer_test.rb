require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'


class ComputerTest < Minitest::Test
  def test_random_ship_coordinates_returns_random_ship_coordinates
    player_comp = Computer.new
    newboard4 = Board.new(4)
    new_board_8 = Board.new(8)
    new_board_12 = Board.new(12)

    coordinates_1 = player_comp.random_ship_coordinates(newboard4)
    coordinates_2 = player_comp.random_ship_coordinates(new_board_8)
    coordinates_3 = player_comp.random_ship_coordinates(new_board_12)

    assert newboard4.contains?(coordinates_1)
    assert new_board_8.contains?(coordinates_2)
    assert new_board_12.contains?(coordinates_3)
    assert_equal 2, coordinates_1.length
    assert_equal 2, coordinates_2.length
    assert_equal 2, coordinates_3.length
  end

  def test_end_coordinates_returns_valid_coordinates
    player_comp = Computer.new
    newboard4 = Board.new(4)
    new_board_8 = Board.new(8)
    new_board_12 = Board.new(12)

    coordinates_1 = player_comp.end_coordinates([[1, 2]], 2, newboard4)
    coordinates_2 = player_comp.end_coordinates([[4, 5]], 2, new_board_8)
    coordinates_3 = player_comp.end_coordinates([[10, 9]], 2, new_board_12)

    assert player_comp.subsequent_choices(1, 2, 1).include? coordinates_1
    assert player_comp.subsequent_choices(4, 5, 1).include? coordinates_2
    assert player_comp.subsequent_choices(10, 9, 1).include? coordinates_3
    assert newboard4.contains?(coordinates_1)
    assert new_board_8.contains?(coordinates_2)
    assert new_board_12.contains?(coordinates_3)
    assert_equal 2, coordinates_1.length
    assert_equal 2, coordinates_2.length
    assert_equal 2, coordinates_3.length
  end

  def test_middle_coordinates_returns_valid_coordinates
    player_comp = Computer.new
    newboard4 = Board.new(4)
    new_board_8 = Board.new(8)
    new_board_12 = Board.new(12)

    coordinates_1 = player_comp.middle_coordinates([[1, 2], [3, 2]], 3)
    coordinates_2 = player_comp.middle_coordinates([[4, 5], [4, 7]], 3)
    coordinates_3 = player_comp.middle_coordinates([[10, 9], [10, 7]], 3)
    coordinates_4 = player_comp.middle_coordinates([[1, 2], [3, 2], [4, 2]], 4)
    coordinates_5 = player_comp.middle_coordinates([[10, 9], [10, 7], [10, 6]], 4)
    coordinates_6 = player_comp.middle_coordinates([[6, 2], [4, 2], [3, 2], [2, 2]], 5)

    assert_equal [2, 2], coordinates_1
    assert_equal [4, 6], coordinates_2
    assert_equal [10, 8], coordinates_3
    assert_equal [2, 2], coordinates_4
    assert_equal [10, 8], coordinates_5
    assert_equal [5, 2], coordinates_6
    assert newboard4.contains?(coordinates_1)
    assert new_board_8.contains?(coordinates_2)
    assert new_board_12.contains?(coordinates_3)
    assert new_board_8.contains?(coordinates_4)
    assert new_board_12.contains?(coordinates_5)
    assert new_board_12.contains?(coordinates_6)
    assert_equal 2, coordinates_1.length
    assert_equal 2, coordinates_2.length
    assert_equal 2, coordinates_3.length
    assert_equal 2, coordinates_4.length
    assert_equal 2, coordinates_5.length
    assert_equal 2, coordinates_6.length
  end

  def test_subsequent_choices_returns_all_four_valid_spaces
    player_comp = Computer.new

    choices_1 = player_comp.subsequent_choices(3, 2, 1)
    choices_2 = player_comp.subsequent_choices(3, 2, 2)
    choices_3 = player_comp.subsequent_choices(3, 2, 3)
    choices_4 = player_comp.subsequent_choices(3, 2, 4)

    assert_equal  [[3, 3], [3, 1], [4, 2], [2, 2]], choices_1
    assert_equal  [[3, 4], [3, 0], [5, 2], [1, 2]], choices_2
    assert_equal  [[3, 5], [3, -1], [6, 2], [0, 2]], choices_3
    assert_equal  [[3, 6], [3, -2], [7, 2], [-1, 2]], choices_4
  end

  def test_computer_can_generate_coordinates_for_2_space_ship
    new_board = Board.new(4)
    player_comp = Computer.new

    coordinates = player_comp.ship_coordinates(new_board, 2)

    assert (0..3).to_a.include? coordinates[0][0]
    assert (0..3).to_a.include? coordinates[0][1]
    assert (0..3).to_a.include? coordinates[1][0]
    assert (0..3).to_a.include? coordinates[1][1]
    assert_equal 2, coordinates.length
  end

  def test_computer_can_generate_coordinates_for_3_space_ship
    new_board = Board.new(4)
    player_comp = Computer.new

    coordinates = player_comp.ship_coordinates(new_board, 3)

    assert (0..3).to_a.include? coordinates[0][0]
    assert (0..3).to_a.include? coordinates[0][1]
    assert (0..3).to_a.include? coordinates[1][0]
    assert (0..3).to_a.include? coordinates[1][1]
    assert (0..3).to_a.include? coordinates[2][0]
    assert (0..3).to_a.include? coordinates[2][1]
    assert_equal 3, coordinates.length
  end

  def test_computer_can_generate_coordinates_for_4_space_ship
    new_board = Board.new(8)
    player_comp = Computer.new

    coordinates = player_comp.ship_coordinates(new_board, 4)

    assert (0..7).to_a.include? coordinates[0][0]
    assert (0..7).to_a.include? coordinates[0][1]
    assert (0..7).to_a.include? coordinates[1][0]
    assert (0..7).to_a.include? coordinates[1][1]
    assert (0..7).to_a.include? coordinates[2][0]
    assert (0..7).to_a.include? coordinates[2][1]
    assert (0..7).to_a.include? coordinates[3][0]
    assert (0..7).to_a.include? coordinates[3][1]
    assert_equal 4, coordinates.length
  end

  def test_computer_can_generate_coordinates_for_5_space_ship
    new_board = Board.new(12)
    player_comp = Computer.new

    coordinates = player_comp.ship_coordinates(new_board, 5)

    assert (0..11).to_a.include? coordinates[0][0]
    assert (0..11).to_a.include? coordinates[0][1]
    assert (0..11).to_a.include? coordinates[1][0]
    assert (0..11).to_a.include? coordinates[1][1]
    assert (0..11).to_a.include? coordinates[2][0]
    assert (0..11).to_a.include? coordinates[2][1]
    assert (0..11).to_a.include? coordinates[3][0]
    assert (0..11).to_a.include? coordinates[3][1]
    assert (0..11).to_a.include? coordinates[4][0]
    assert (0..11).to_a.include? coordinates[4][1]
    assert_equal 5, coordinates.length
  end
end
