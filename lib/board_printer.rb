require './lib/board'

class BoardPrinter
  def formats_board(board)
    alpha = ('A'..'Z').to_a
    formatted_board = []
    board.board.each_with_index do |line, i|
      if i.zero?
        formatted_board << ['       '] + [(1..board.size).to_a.join('   ')]
      end
      formatted_board << ["\n\n   "] + [alpha[i]] + line_converter(line)
    end
    formatted_board.join.rstrip
  end

  def line_converter(line)
    line.map do |el|
      el = if el == :empty || el == :ship
             '   .'
           elsif el == :hit
             '   H'
           else
             '   M'
           end
    end
  end
end
