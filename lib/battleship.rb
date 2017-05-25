require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/messages'

class Battleship
  include Messages
  attr_reader   :player,
                :computer
  attr_accessor :player_ship_board,
                :computer_ship_board

  def initialize
    @player = Player.new
    @computer = Computer.new
    @board_printer = BoardPrinter.new
  end

  def welcome
    input = welcome_message.downcase
    if input == 'p'
      board_and_ship_setup
    elsif input == 'q'
      exit
    elsif input == 'i'
      instructions_message
      board_and_player_setup
    end
  end

  def board_and_ship_setup
    input = difficulty_message.downcase
    if input == 'b'
      new_boards(4)
      ships(input)
    elsif input == 'i'
      new_boards(8)
      ships(input)
    elsif input == 'a'
      new_boards(12)
      ships(input)
    end
    ship_placement
  end

  def new_boards(size)
    @player_ship_board = Board.new(size)
    @computer_ship_board = Board.new(size)
    @player_shot_board = Board.new(size)
    @computer_shot_board = Board.new(size)
  end

  def ships(input)
    @ships = if input == 'b'
               [2, 3]
             elsif input == 'i'
               [2, 3, 4]
             else
               [2, 3, 4, 5]
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
      place_ship(@computer_ship_board, coordinates, n)
    end
  end

  def player_place_ships
    @ships.each do |n|
      coordinates = gets_player_ship_placement_message(n)
      valid_coordinates = player.convert_to_ship_coordinates(coordinates, n)
      until valid_coordinates
        invalid_ship_placement_message
        coordinates = gets_player_ship_placement_message(n)
        valid_coordinates = player.convert_to_ship_coordinates(coordinates, n)
      end
      place_ship(@player_ship_board, valid_coordinates, n)
    end
  end

  def place_ship(board, coordinates, n)
    board.ship(coordinates, n)
  end

  def game_sequence
    shots = 0
    start_time = Time.now
    until all_player_ships_sunk
      player_shoot
      end_game(shots, start_time) if all_computer_ships_sunk
      computer_shoot
      shots += 1
    end
    end_game(shots, start_time)
  end

  def player_shoot
    player_board_banner_message
    @computer_ship_board.print_board(@board_printer)
    player_shot = player_shot_message
    valid_shot = player.convert_to_shot_coordinates(player_shot)
    until valid_shot
      invalid_shot_message
      player_shot = player_shot_message
      valid_shot = player.convert_to_shot_coordinates(player_shot)
    end
    player_shot_result(valid_shot)
  end

  def player_shot_result(valid_shot)
    result = @computer_ship_board.hit_or_miss(valid_shot)
    if result == :miss
      player_miss_message
    elsif result == :hit
      player_hit_message
    else
      player_sunk_message(result)
    end
    player_board_banner_message
    @computer_ship_board.print_board(@board_printer)
    continue_message
  end

  def computer_shoot
    computer_shot = computer.random_shot_coordinates(player_ship_board)
    computer_shot_result(computer_shot)
  end

  def computer_shot_result(computer_shot)
    result = @player_ship_board.hit_or_miss(computer_shot)
    if result == :miss
      computer_miss_message
    elsif result == :hit
      computer_hit_message
    else
      computer_sunk_message(result)
    end
    computer_board_banner_message
    @player_ship_board.print_board(@board_printer)
    new_line_message
  end

  def end_game(shots, start_time)
    if all_player_ships_sunk
      computer_win_message(shots)
    else
      player_win_message(shots)
    end
    elapsed_time = (Time.now - start_time).round
    elapsed_time_message(elapsed_time)
  end

  def all_player_ships_sunk
    @player_ship_board.board.flatten.count { |s| s.class == Fixnum }.zero?
  end

  def all_computer_ships_sunk
    @computer_ship_board.board.flatten.count { |s| s.class == Fixnum }.zero?
  end
end

new_game = Battleship.new
new_game.welcome
