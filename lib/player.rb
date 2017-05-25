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

  def convert_to_ship_coordinates(input, ship_length)
    return false if strip_split_and_validate(input) == false
    valid_input = strip_split_and_validate(input)
    coordinates = []

    valid_input.each_with_index do |el, i|
      coordinates << [@convertor[valid_input[i - 1]], (el.to_i - 1)] if i.odd?
    end
    return coordinates if coordinates.flatten.length == ship_length * 2
    false
  end

  def convert_to_shot_coordinates(input)
    return false if strip_split_and_validate(input) == false
    valid_input = strip_split_and_validate(input)
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

  def strip_split_and_validate(input)
    alpha = @convertor.keys
    stripped_downcased = input.delete(' ').downcase
    units = stripped_downcased.split('')
    return false if units.empty?

    units.each_with_index do |unit, i|
      if i.even?
        return false unless alpha.include?(unit)
      else
        return false if unit.to_i.zero?
      end
    end
    units
  end

  # def valid?(board, coordinates)
  #   coordinates.each do |pair|
  #     if !board.contains?(coordinates)
  #       return 'That location does not exist'
  #     elsif !board.empty?(coordinates)
  #       return 'Your move conflicts with another ship'
  #     end
  #   end
  # end

  # def sequential?(coordinates)
  #   comparison = {}
  #   coordinates.each do |pair|
  #     if comparison[pair[0]].nil?
  #       comparison[pair[0]] = []
  #     end
  #     comparison[pair[0]] << pair[1]
  #   end
  #
  #   if comparison.keys.length == 1
  #     values = comparison.values.sort
  #     return values.all?.with_index { |v, i| v + 1 == values[i + 1] }
  #   else
  #     keys = comparison.keys.sort
  #     return keys.all?.with_index { |k, i| k + 1 == keys[i + 1]}
  #   end
  # end
end
