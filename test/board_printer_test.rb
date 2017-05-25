require 'minitest/autorun'
require 'minitest/pride'
require './lib/board_printer'
require './lib/board'
require 'pry'

class BoardPrinterTest < Minitest::Test
  def test_small_board_to_s
    new_board = Board.new(4)
    new_printer = BoardPrinter.new
    board =
    <<-BOARD
       1   2   3   4

   A   .   .   .   .

   B   .   .   .   .

   C   .   .   .   .

   D   .   .   .   .
   BOARD

    expected_board = board.chomp
    actual_board = new_printer.formats_board(new_board)

    assert_equal expected_board, actual_board
  end

  def test_medium_board_to_s
    new_board = Board.new(8)
    new_printer = BoardPrinter.new

    board =
    <<-BOARD
       1   2   3   4   5   6   7   8

   A   .   .   .   .   .   .   .   .

   B   .   .   .   .   .   .   .   .

   C   .   .   .   .   .   .   .   .

   D   .   .   .   .   .   .   .   .

   E   .   .   .   .   .   .   .   .

   F   .   .   .   .   .   .   .   .

   G   .   .   .   .   .   .   .   .

   H   .   .   .   .   .   .   .   .
    BOARD

    expected_board = board.chomp
    actual_board = new_printer.formats_board(new_board)

    assert_equal expected_board, actual_board
  end

  def test_large_board_to_s
    skip
    new_printer = BoardPrinter.new
    new_board = Board.new(12)
    board =
    <<~BOARD
         1  2  3  4  5  6  7  8  9 10 11 12
      A   .   .   .   .   .   .   .   .   .   .   .   .
      B   .   .   .   .   .   .   .   .   .   .   .   .
      C   .   .   .   .   .   .   .   .   .   .   .   .
      D   .   .   .   .   .   .   .   .   .   .   .   .
      E   .   .   .   .   .   .   .   .   .   .   .   .
      F   .   .   .   .   .   .   .   .   .   .   .   .
      G   .   .   .   .   .   .   .   .   .   .   .   .
      H   .   .   .   .   .   .   .   .   .   .   .   .
      I   .   .   .   .   .   .   .   .   .   .   .   .
      J   .   .   .   .   .   .   .   .   .   .   .   .
      K   .   .   .   .   .   .   .   .   .   .   .   .
      L   .   .   .   .   .   .   .   .   .   .   .   .
    BOARD

    expected_board = board.chomp

    assert_equal expected_board, new_printer.formats_board(new_board)
  end
end
