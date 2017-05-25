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
  end

  def convert_to_coordinates(input)
    stripped_downcased = input.delete(' ').downcase
    units = stripped_downcased.split('')
    coordinates = []

    units.each_with_index do |el, i|
      coordinates << [@convertor[units[i - 1]], (el.to_i - 1)] if i.odd?
    end
    coordinates
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
