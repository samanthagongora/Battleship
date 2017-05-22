require './lib/board'

class BoardPrinter
  def initialize(board)
    @board = board
  end

  def formats_board(board)
    puts alpha = ('A'..'Z').to_a
    formatted_board = []
    @board.each_with_index do |i, line|
      formatted_board << (1..@board.length).to_a if i == 0
      formatted_board << alpha[i] + line
    end
    formatted_board
  end

  def print_board
    formats_board(@board)
  end
end

new_board = Board.new(4)
new_print = BoardPrinter.new(new_board)
new_print.print_board
