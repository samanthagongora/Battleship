require './lib/board'

class BoardPrinter
  def formats_board(board)
    alpha = ('A'..'Z').to_a
    formatted_board = []
    board.board.each_with_index do |line, i|
      if i.zero?
        formatted_board << format_numbers(board)
      end
      formatted_board << ["\n\n"] + [alpha[i]] + format_line(line)
    end
    formatted_board.join.rstrip
  end

  def format_numbers(board)
    if board.size < 9
      return ['    '] + [(1..board.size).to_a.join('   ')]
    else
      ['    '] + [(1..9).to_a.join('   ')] + ['  '] + [(10..board.size).to_a.join('  ')]
    end
  end


  def format_line(line)
    line.map do |el|
      el = if el == :empty || el.class == Integer
             '   .'
           elsif el == :hit
             '   H'
           else
             '   M'
           end
    end
  end
end
