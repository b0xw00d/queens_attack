module Runner
  extend self

  def play
    positions = get_user_input
    if check_user_input(positions[:white], positions[:black])
      game = Game.new(positions)
      puts game.print_board
      goodbye(game)
    else
      input_error
    end
  end

  def get_user_input
    puts "\nPlease enter two coordinates for white's queen separated by a space."
    white_position = STDIN.gets.chomp.split(" ")
    puts "Please enter two coordinates for black's queen separated by a space."
    black_position = STDIN.gets.chomp.split(" ")
    {white: white_position, black: black_position}
  end

  def check_user_input(white, black)
    check_input_length(white, black) && check_input_range(white, black)
  end

  def goodbye(game)
    game.is_a_hit? ? "\e[32mDIRECT HIT!\e[0m" : "\e[31mYou missed...\e[0m"
  end

  private

  def input_error
    "!!! \nYour input is invalid.  Please try again."
  end

  def check_input_length(white_position, black_position)
    white_position.length == 2 && black_position.length == 2
  end

  def check_input_range(white_position, black_position)
    all_coordinates = [white_position, black_position].flatten!
    all_coordinates.all?{|coord| coord.to_i <= 7 && coord.to_i >= 0}
  end
end
