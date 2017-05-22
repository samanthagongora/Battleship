require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require 'pry'

class ComputerTest < Minitest::Test
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
