require 'pry'

class Board
  attr_reader :size, :board
  def initialize(size)
    @size = size
    @board = play_field
  end

  def play_field
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

  # def hit(coordinates)
  #
  # end
  #
  # def miss(coordinates)
  #
  # end

  def ship(coordinates)
    coordinates.each do |pair|
      row = pair[0]
      column = pair[1]
      @board[row][column] = :ship
    end
  end
end
