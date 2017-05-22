require 'pry'

class Board
  attr_reader :size
  def initialize(size)
    @size = size
  end

  def board
    board =[]
    (@size).times { board << Array.new(@size, :empty) }
    board
  end

  def contains?(coordinates)
    (0 <= coordinates[0] && coordinates[0] <= @size - 1) &&
      (0 <= coordinates[1] && coordinates[1] <= @size - 1)
  end

  def empty?(coordinates)
    row = coordinates[0]
    column = coordinates[1]
    board[row][column] == :empty
  end

  def hit(coordinates)

  end

  def miss(coordinates)

  end

  def ship(coordinates)
    row = coordinates[0]
    column = coordinates[1]
    board[row][column] = 'sh'
  end
end
