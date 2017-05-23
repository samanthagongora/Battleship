require './lib/board'
require './lib/player'
require './lib/computer'
require 'pry'

# class BattleShipLoader
#   def get_settings
#   puts 'what difficulty?'
#   game = Battleship.new(size: 4) # size based on difficulty
#   game.run_game
# end

class Battleship
  attr_reader   :player,
                :computer
  attr_accessor :player_shot_board,
                :computer_shot_board,
                :player_ship_board,
                :computer_ship_board

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def board_and_player_setup
    puts "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input_1 = gets.chomp.downcase
    if input_1 == 'p'
      puts 'Would you like to play (b)eginner, (i)termediate, or (a)dvanced?'
      input_2 = gets.chomp.downcase
        if input_2 == 'b'
          new_boards(4)
          ships
        elsif input_2 == 'i'
          new_boards(8)
          ships
        elsif input_2 == 'a'
          new_boards(12)
          ships
        end
      ship_placement
    elsif input_1 == 'q'
      exit
    elsif input_1 == 'i'
      puts 'instructions here'
    #todo: guard clause for invalid entry
    end
  end

  def new_boards(size)
    @player_ship_board = Board.new(size)
    @computer_ship_board = Board.new(size)
    @player_shot_board = Board.new(size)
    @computer_shot_board = Board.new(size)
  end

  def ships
    if @player_shot_board.board.size == 4
      @ships = [2, 3]
    elsif @player_shot_board.board.size == 8
      @ships = [2,3,4]
    else
      @ships = [2,3,4,5]
    end
  end

  def ship_placement
    computer_place_ships(@ships, @computer_ship_board)
    puts "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right."
    player_place_ships(@ships, @player_ship_board)
  end

  def computer_place_ships(ships, computer_ship_board)
    @ships.each do |n|
      coordinates = computer.ship_coordinates(@computer_ship_board, n)
      place_ship(@computer_ship_board, coordinates)
    end
  end

  def player_place_ships(ships, player_ship_board)
    @ships.each do |n|
      coordinates = player.ship_coordinates(@player_ship_board, n)
      place_ship(@player_ship_board, coordinates)
    end
  end

  def place_ship(board, coordinates)
    board.ship(coordinates)
  end
end

# new_game = Battleship.new
# new_game.board_and_player_setup
