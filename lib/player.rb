require './lib/board'
require 'pry'

class Player
  def initialize
    @convertor = { 'a' => 0,
                   'b' => 1,
                   'c' => 2,
                   'd' => 3,
                   'e' => 4,
                   'f' => 5,
                   'g' => 6,
                   'h' => 7,
                   'i' => 8,
                   'j' => 9,
                   'k' => 10,
                   'l' => 11 }
    @shots = []
  end

  def convert_to_ship_coordinates(board, input, ship_length)
    return false if strip_and_format(input) == false
    valid_input = strip_and_format(input)
    coordinates = []

    valid_input.each_with_index do |el, i|
      coordinates << [@convertor[valid_input[i - 1]], (el.to_i - 1)] if i.odd?
    end

    if coordinates.flatten.length == ship_length * 2
      return coordinates if valid_ship_coordinates?(board, coordinates)
    end
    false
  end

  def convert_to_shot_coordinates(input)
    return false if strip_and_format(input) == false
    valid_input = strip_and_format(input)
    coordinates = []

    valid_input.each_with_index do |el, i|
      coordinates << [@convertor[valid_input[i - 1]], (el.to_i - 1)] if i.odd?
    end
    return false if @shots.include?(coordinates)

    if coordinates.flatten.length == 2
      @shots << coordinates
      return coordinates
    end
    false
  end

  def strip_and_format(input)
    alpha = @convertor.keys
    stripped_downcased = input.delete(' ').downcase
    units = stripped_downcased.split('')
    return false if units.empty?

    units.each_with_index do |unit, i|
      if i.even?
        return false unless alpha.include?(unit)
      elsif unit.to_i.zero?
        return false
      end
    end
    units
  end

  def valid_ship_coordinates?(board, coordinates)
    return false unless sequential?(coordinates)
    coordinates.each do |c|
      return false if !board.contains?(c) || !board.empty?(c)
    end
    true
  end

  def sequential?(coordinates)
    comparison = compile_coordinates(coordinates)
    flattened_values = comparison.values.flatten
    flattened_keys = comparison.keys.flatten

    if comparison.keys.length == 1
      max_value = flattened_values.max
      min_value = flattened_values.min
      return true if flattened_values.sort == (min_value..max_value).to_a
    elsif flattened_values.uniq.length == 1
      sorted_keys = flattened_keys.sort
      max_key = flattened_keys.max
      min_key = flattened_keys.min
      # binding.pry
      return true if sorted_keys == (min_key..max_key).to_a
    end
    false
  end

  def compile_coordinates(coordinates)
    comparison = {}
    coordinates.each do |pair|
      comparison[pair[0]] = [] if comparison[pair[0]].nil?
      comparison[pair[0]] << pair[1]
    end
    comparison
  end
end
