require './lib/messages'
require './lib/board_printer'

class Board
  include Messages
  attr_reader :size, :board

  def initialize(size)
    @size = size
    @board = []
    @size.times { @board << Array.new(@size, :empty) }
    @board_printer = BoardPrinter.new
  end

  def contains?(coordinates)
    (0 <= coordinates[0] && coordinates[0] <= @size - 1) &&
      (0 <= coordinates[1] && coordinates[1] <= @size - 1)
  end

  def empty?(coordinates)
    row = coordinates.flatten[0]
    column = coordinates.flatten[1]

    @board[row][column] == :empty
  end

  def hit_or_miss(coordinates)
    row = coordinates.flatten[0]
    column = coordinates.flatten[1]
    ship_size = @board[row][column]

    if empty?(coordinates)
      @board[row][column] = :miss
      return :miss
    else
      @board[row][column] = :hit
      return :hit if @board.flatten.include?(ship_size)
      ship_size
    end
  end

  def ship(coordinates, ship_length)
    coordinates.each do |pair|
      row = pair[0]
      column = pair[1]
      @board[row][column] = ship_length
    end
  end

  def print_board(board_printer)
    puts board_printer.formats_board(self)
  end
end
