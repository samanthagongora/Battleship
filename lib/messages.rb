module Messages
  def welcome_message
    puts "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    gets.chomp
  end

  def difficulty_message
    puts 'Would you like to play (b)eginner, (i)termediate, or (a)dvanced?'
    gets.chomp
  end

  def instructions_message
    puts "The object of the game is to be the first to sink your opponents ships. First, you will place your ships on the battlefield. Players will take turns firing missles by calling coordinates.\n Press enter to return to the home screen."
    gets.chomp
  end

  def computer_ship_placement_message
    puts "I have laid out my ships on the grid.
   You now need to layout your two ships.
   The first is two units long and the
   second is three units long.
   The grid has A1 at the top left and D4 at the bottom right."
  end

  def gets_player_ship_placement_message(ship_length)
    puts "Please enter the coordinates for the #{ship_length}-unit ship"
    gets.chomp
  end

  def player_board_banner_message
    puts 'Your battlefield:'
  end

  def computer_board_banner_message
    puts "Computer's battlefield:"
  end

  def new_line_message
    puts "\n"
  end

  def player_shot_message
    puts 'Please enter a coordinate to fire ze missle:'
    gets.chomp
  end

  def invalid_shot_message
    puts 'You must enter a unique coordinate contained by the board.'
  end

  def player_hit_message
    puts 'You hit an enemy ship!'
  end

  def player_miss_message
    puts 'You missed!'
  end

  def continue_message
    puts "Press 'enter' to continue."
    gets
  end

  def computer_miss_message
    puts 'Your ships are safe...for now.'
  end

  def computer_hit_message
    puts 'Your ship was hit!'
  end

  def player_win_message(shot_count)
    puts "Congratulations, you won!\nIt took you #{shot_count} shots to sink my battleships."
  end

  def computer_win_message(shot_count)
    puts "Better luck next time, nerd. It took me #{shot_count} shots to sink your battleships."
  end

  def elapsed_time_message(elapsed_time)
    puts "Total elapsed time: #{elapsed_time} seconds"
  end
end
