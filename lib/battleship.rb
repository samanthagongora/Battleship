require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/messages'
require 'pry'

# class BattleShipLoader
#   def get_settings
#   puts 'what difficulty?'
#   game = Battleship.new(size: 4) # size based on difficulty
#   game.run_game
# end

class Battleship
  include Messages
  attr_reader   :player,
                :computer
  attr_accessor :player_shot_board,
                :computer_shot_board,
                :player_ship_board,
                :computer_ship_board

  def initialize
    @player = Player.new
    @computer = Computer.new
    @board_printer = BoardPrinter.new
  end

  def board_and_player_setup
    input_1 = welcome_message.downcase
    if input_1 == 'p'
      input_2 = difficulty_message.downcase
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
      instructions
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
    computer_place_ships
    computer_ship_placement_message
    player_place_ships
    game_sequence
  end

  def computer_place_ships
    @ships.each do |n|
      coordinates = computer.ship_coordinates(@computer_ship_board, n)
      place_ship(@computer_ship_board, coordinates)
    end
  end

  def player_place_ships
    @ships.each do |n|
      coordinates = gets_player_ship_placement_message(n)
      valid_coordinates = player.convert_to_coordinates(coordinates)
      place_ship(@player_ship_board, valid_coordinates)
    end
  end

  def place_ship(board, coordinates)
    board.ship(coordinates)
  end

  def game_sequence
    shots = 0
    start_time = Time.now
    until @player_ship_board.board.reduce(0) {|acc, line| acc += line.count { |space| space == :ship }}.zero? || @computer_ship_board.board.reduce(0) {|acc, line| acc += line.count { |space| space == :ship }}.zero?
      player_shoot
      computer_shoot
      shots += 1
    end
    end_game(shots, start_time)
  end

  def player_shoot
    @computer_ship_board.print_board(@board_printer)
    player_shot = player_shot_message
    valid_shot = player.convert_to_coordinates(player_shot).flatten
    result = @computer_ship_board.hit_or_miss(computer_ship_board, valid_shot)
    if result == :miss
      player_miss_message
    else
      player_hit_message
    end
    @computer_ship_board.print_board(@board_printer)
    continue_message
  end

  def computer_shoot
    computer_shot = computer.random_coordinates(player_ship_board)
    result = @player_ship_board.hit_or_miss(player_ship_board, computer_shot)
    if result == :miss
      computer_miss_message
    else
      computer_hit_message
    end
    @player_ship_board.print_board(@board_printer)
  end

  def end_game(shots, start_time)
    if @player_ship_board.board.reduce(0) {|acc, line| acc += line.count { |space| space == :ship }}.zero?
      player_lose_message(shots)
    else
      player_win_message(shots)
    end
    elapsed_time = (Time.now - start_time).round
    elapsed_time_message(elapsed_time)
  end
end

new_game = Battleship.new
new_game.board_and_player_setup
