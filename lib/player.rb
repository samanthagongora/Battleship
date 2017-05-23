require './lib/board'
require 'pry'

class Player
  def initialize
    @convertor = {'a' => 0,
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
                  'l' => 11,
                 }
  end

  def ship_coordinates(board, ship_length)
    puts "Please enter the coordinates for the #{ship_length}-unit ship"
    input = gets.chomp.downcase
    return convert_to_coordinates(input, ship_length)
  end

  def convert_to_coordinates(input, ship_length)
    stripped = input.delete(' ')
    units = stripped.split('')
    coordinates = []

    units.each_with_index do |el, i|
      if i.odd?
        coordinates << [@convertor[units[i - 1]], el.to_i]
      end
    end
    coordinates
  end
end
