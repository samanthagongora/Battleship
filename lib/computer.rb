require './lib/board'

class Computer
  def initialize
    @shots = []
  end

  def ship_coordinates(board, ship_length)
    coordinates = []
    coordinates << random_ship_coordinates(board)
    coordinates << end_coordinates(coordinates, ship_length, board)
    until coordinates.length == ship_length
      middle_coordinates = middle_coordinates(coordinates, ship_length)
      if valid_ship_coordinate?(board, middle_coordinates)
        coordinates.insert(1, middle_coordinates(coordinates, ship_length))
      else
        break
      end
    end
    ship_coordinates(board, ship_length) if coordinates.length != ship_length
    coordinates
  end

  def random_ship_coordinates(board)
    first_coordinates = random_coordinates(board)
    return first_coordinates if valid_ship_coordinate?(board, first_coordinates)
    random_ship_coordinates(board)
  end

  def end_coordinates(coordinates, ship_length, board)
    row = coordinates[0][0]
    column = coordinates[0][1]
    delta_dist = ship_length - 1
    choices = subsequent_choices(row, column, delta_dist)
    valid_choices = choices.select { |choice| valid_ship_coordinate?(board, choice) }
    valid_choices.sample
  end

  def subsequent_choices(row, column, delta_dist)
    [[row, column + delta_dist],
     [row, column - delta_dist],
     [row + delta_dist, column],
     [row - delta_dist, column]]
  end

  def middle_coordinates(coordinates, _ship_length)
    first_row = coordinates[0][0]
    first_column = coordinates[0][1]
    end_column = coordinates[1][1]
    end_row = coordinates[1][0]
    if first_row == end_row && first_column < end_column
      return [end_row, (end_column - 1)]
    elsif first_row == end_row && first_column > end_column
      return [end_row, (end_column + 1)]
    elsif first_column == end_column && first_row < end_row
      return [(end_row - 1), end_column]
    else
      return [(end_row + 1), end_column]
    end
  end

  def valid_ship_coordinate?(board, coordinates)
    board.contains?(coordinates) && board.empty?(coordinates)
  end

  def random_shot_coordinates(board)
    shot_coordinate = random_coordinates(board)
    return shot_coordinate if valid_shot_coordinate?(board, shot_coordinate)
    random_shot_coordinates(board)
  end

  def valid_shot_coordinate?(_board, coordinates)
    return false if @shots.include?(coordinates)
    @shots << coordinates
  end

  def random_coordinates(board)
    [rand(0..board.size - 1), rand(0..board.size - 1)]
  end
end
